#Log into Azure with CLI
az login
az account set --subscription "SUB_NAME"

id=$(((RANDOM%9999+1)))
prefix="cmk"
location="eastus"
resource_group="$prefix-key-vault-$id"
key_vault_name="$prefix-key-vault-$id"
storage_account_name="${prefix}sa$id"
log_analytics_name="$prefix-keyvaultstats-$id"

#Create an Azure Key Vault
az group create -n $resource_group -l $location
az keyvault create -n $key_vault_name -g $resource_group \
  -l $location --sku Standard

#Or if you have an existing key vault
resource_group="existing_key_vault_resource_group_name"
key_vault_name="existing_key_vault_name"

#Create a storage account for logs and metrics
az storage account create -n $storage_account_name -g $resource_group \
  -l $location --sku Standard_LRS

#Create a Log Analytics Workspace
az group deployment create --resource-group $resource_group \
  --name "LogAnalyticsDeploy" \
  --mode Incremental \
  --template-file LogAnalytics.json \
  --parameters workspaceName=$log_analytics_name

#Update Diagnostic Settings for Key Vault
key_vault_id=$(az keyvault show --name $key_vault_name --resource-group $resource_group | jq -r .id)

az monitor diagnostic-settings create --name "LogAndStorage" \
  --workspace $log_analytics_name \
  --storage-account $storage_account_name \
  --resource $key_vault_id \
  --logs '[
      {
          "category": "AuditEvent",
          "enabled": true,
          "retentionPolicy": {
              "enabled": true,
              "days": 180
          }
      }
  ]' \
  --metrics '[
      {
          "category": "AllMetrics",
          "enabled": true,
          "retentionPolicy": {
              "enabled": true,
              "days": 180 
          } 
      }
  ]'