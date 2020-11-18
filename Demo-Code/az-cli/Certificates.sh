#Log into Azure with CLI
az login
az account set --subscription "SUB_NAME"

id=$(((RANDOM%9999+1)))
prefix="cmk"
location="eastus"
resource_group="$prefix-key-vault-$id"
key_vault_name="$prefix-key-vault-$id"

#Create an Azure Key Vault
az group create -n $resource_group -l $location
az keyvault create -n $key_vault_name -g $resource_group \
  -l $location --sku Standard

#Or if you have an existing key vault
resource_group="existing_key_vault_resource_group_name"
key_vault_name="existing_key_vault_name"

#Create the certificate request
#Edit the CertPolicy doc as you would like
az keyvault certificate create --vault-name $key_vault_name \
  --name www-cert --policy @CertPolicy.json

#Creat the CSR file
echo "-----BEGIN CERTIFICATE REQUEST-----" > www-cert.csr
az keyvault certificate pending show --vault-name $key_vault_name --name www-cert | jq -r .csr >> www-cert.csr
echo "-----END CERTIFICATE REQUEST-----" >> www-cert.csr

#Let's create a local Certificate Authority using openssl
subject="/C=US/ST=Pennsylvania/L=Springfield/O=Contoso, Inc./OU=IT/CN=Contoso"

#Create a CA key
openssl genrsa -out ca.key.pem 4096

#Creata a CA certificate
openssl req -key ca.key.pem -new -x509 \
  -days 7300 -sha256 -out ca.cert.pem \
  -extensions v3_ca -subj "$subject"

#Create the certificate from the request
openssl x509 -req -days 180 -CA ca.cert.pem \
  -CAkey ca.key.pem -CAcreateserial \
  -in www-cert.csr -out www-cert.pem

#Import the certificate back to Key Vault
az keyvault certificate pending merge --file www-cert.pem \
  --vault-name $key_vault_name \
  --name www-cert




