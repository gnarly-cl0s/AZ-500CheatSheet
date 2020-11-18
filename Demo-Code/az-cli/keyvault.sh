#Log into Azure with CLI
az login
az account set --subscription "SUB_NAME"

id=$(((RANDOM%9999+1)))
prefix="cmk"
location="eastus"
resource_group="$prefix-key-vault-$id"
key_vault_name="$prefix-key-vault-$id"
storage_account_name="${prefix}sa$id"


#Create an Azure Key Vault
az group create -n $resource_group -l $location
az keyvault create -n $key_vault_name -g $resource_group \
  -l $location --sku Premium

az storage account create -n $storage_account_name -g $resource_group \
  -l $location --sku Standard_LRS

az storage account keys list -g $resource_group -n $storage_account_name

sa_id=$(az storage account show -n $storage_account_name | jq -r .id)

az role assignment create --role "Storage Account Key Operator Service Role" \
  --assignee 'https://vault.azure.net' --scope $sa_id

az keyvault storage add --vault-name $key_vault_name \
  -n $storage_account_name \
  --active-key-name key1 \
  --auto-regenerate-key --regeneration-period P90D \
  --resource-id $sa_id

az storage account show -g $resource_group -n $storage_account_name

az storage account keys list -g $resource_group -n $storage_account_name

az keyvault storage regenerate-key --vault-name $key_vault_name \
  --name $storage_account_name --key-name key1

az storage account keys list -g $resource_group -n $storage_account_name