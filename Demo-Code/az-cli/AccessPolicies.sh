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

#Create an access policy for keys and secrets using policy
backup_service_id="262044b1-e2ce-469f-a196-69ab7ada62d3"

az keyvault set-policy --name $key_vault_name \
  --object-id $backup_service_id \
  --resource-group $resource_group \
  --secret-permissions backup get list \
  --key-permissions backup get list