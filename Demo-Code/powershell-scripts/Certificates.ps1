#Prefix for resources
$prefix = "cmk"

#Basic variables
$location = "eastus"
$id = Get-Random -Minimum 1000 -Maximum 9999

#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

#Create a resource group for Key Vault
$keyVaultGroup = New-AzResourceGroup -Name "$prefix-key-vault-$id" -Location $location

#Create a new Key Vault
$keyVaultParameters = @{
    Name = "$prefix-key-vault-$id"
    ResourceGroupName = $keyVaultGroup.ResourceGroupName
    Location = $location
    Sku = "Premium"
}

$keyVault = New-AzKeyVault @keyVaultParameters

#If you already have a Key Vault
$keyVault = Get-AzKeyVault -VaultName "VAULT_NAME" -ResourceGroupName "RESOURCE_GROUP_NAME"

$policyParameters = @{
    SecretContentType = "application/x-pkcs12"
    SubjectName = "CN=www.Contoso-ned.xyz"
    IssuerName = "Unknown"
    ValidityInMonths = 6
}

$policy = New-AzKeyVaultCertificatePolicy @policyParameters

$certRequest = Add-AzKeyVaultCertificate -VaultName $keyVault.VaultName -Name "www-cert" -CertificatePolicy $policy

#Now create the CSR file that we will sign as a certificate and send back to Key Vault
$inFile = ".\www-cert.csr"
$outFile = ".\www-cert.pem"

Add-Content -Path $inFile -Value "-----BEGIN CERTIFICATE REQUEST-----" -Encoding Ascii
Add-Content -Path $inFile -Value $certRequest.CertificateSigningRequest -Encoding Ascii
Add-Content -Path $inFile -Value "-----END CERTIFICATE REQUEST-----" -Encoding Ascii

#Let's create a local Certificate Authority using openssl
$SUBJECT = "/C=US/ST=Pennsylvania/L=Springfield/O=Contoso, Inc./OU=IT/CN=Contoso"

#Create a CA key
openssl genrsa -out ca.key.pem 4096

#Creata a CA certificate
openssl req -key ca.key.pem -new -x509 -days 7300 -sha256 -out ca.cert.pem -extensions v3_ca -subj $SUBJECT

#Create the certificate from the request
openssl x509 -req -days 180 -CA ca.cert.pem -CAkey ca.key.pem -CAcreateserial -in $inFile -out $outFile

#Import the certificate back to Key Vault
Import-AzKeyVaultCertificate -VaultName $keyVault.VaultName -Name "www-cert" -FilePath $outFile