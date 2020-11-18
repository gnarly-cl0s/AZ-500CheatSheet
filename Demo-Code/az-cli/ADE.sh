#Log into Azure with CLI
az login
az account set --subscription "SUB_NAME"

id=$(((RANDOM%9999+1)))
prefix="cmk"
location="eastus"
resource_group="$prefix-windows-vm-$id"
key_vault_name="$prefix-key-vault-$id"
vm_name="$prefix-win-vm-$id"
dns_name="$prefix$id"
kek_name="$prefix-kek-$id"

#Create the resource group for the VM
az group create -n $resource_group -l $location

#Deploy the #Windows VM template
az group deployment create --resource-group $resource_group \
  --name "WindowsVMDeploy" \
  --mode Incremental \
  --template-file WindowsVM.json \
  --parameters adminUsername="winadmin" \
  adminPassword='' dnsName=$dns_name \
  vmName=$vm_name

#Create a new Key Vault
az keyvault create -n $key_vault_name -g $resource_group \
  -l $location --sku Standard --enabled-for-disk-encryption \
  --enabled-for-deployment
  
#Create a Key Encrypting Key
az keyvault key create --name $kek_name \
  --vault-name $key_vault_name -p software

#Retrieve the kid
kid=$(az keyvault key show --name $kek_name --vault-name $key_vault_name | jq -r .key.kid)

#Apply encryption to the VM
az vm encryption enable --disk-encryption-keyvault $key_vault_name \
  --name $vm_name --resource-group $resource_group \
  --key-encryption-key $kid --key-encryption-keyvault $key_vault_name \
  --volume-type ALL

  