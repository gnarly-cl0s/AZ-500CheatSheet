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
  -l $location --sku Premium

#Or if you have an existing key vault
resource_group="existing_key_vault_resource_group_name"
key_vault_name="existing_key_vault_name"

#Get the current subscription ID and create the custom role json
subId=$(az account show | jq -r .id)
sed s/SUBSCRIPTION_ID/$subId/g custom_role.json > updated_role.json

#Get the role ID, vault ID, and user ID
role=$(az role definition create --role-definition updated_role.json)
vaultId=$(az keyvault show -g $resource_group -n $key_vault_name | jq -r .id)
user=$(az ad user show  --id "USER_PRINCIPAL_NAME" | jq -r .objectId)

#Assign the role to the user with the vault as the scope
az role assignment create --role "Secret Reader" \
  --assignee $user --scope $vaultId