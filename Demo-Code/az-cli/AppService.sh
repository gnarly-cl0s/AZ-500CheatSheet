#Log into Azure with CLI
az login
az account set --subscription "SUB_NAME"

id=$(((RANDOM%9999+1)))
prefix="cmk"
location="eastus"
resource_group="$prefix-key-vault-$id"
key_vault_name="$prefix-key-vault-$id"
app_resource_group="$prefix-app-service-$id"

#Create an Azure Key Vault
az group create -n $resource_group -l $location
az keyvault create -n $key_vault_name -g $resource_group \
  -l $location --sku Standard

#Or if you have an existing key vault
resource_group="existing_key_vault_resource_group_name"
key_vault_name="existing_key_vault_name"

#Create an App Service instance
az group create -n $app_resource_group -l $location

#Deploy the App Service template
az group deployment create --resource-group $app_resource_group \
  --name "AppServiceDeploy" \
  --mode Incremental \
  --template-file AppService.json \
  --parameters prefix=$prefix id=$id

#Get the Principal ID from the Web App
app_service_id=$(az group deployment show --name AppServiceDeploy --resource-group cmk-app-service-1649 | jq -r .properties.outputs.principalId.value)

#Grant App Service access to Key Vault
az keyvault set-policy --name $key_vault_name \
  --object-id $app_service_id \
  --resource-group $resource_group \
  --secret-permissions get

#Store a secret in Key Vault for App Service to retrieve
az keyvault secret set --value "ContosoSuperSecret" \
  --name "webappsecret" \
  --vault-name $key_vault_name

echo $key_vault_name


