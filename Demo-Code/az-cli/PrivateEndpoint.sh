#Log into Azure with CLI
az login
az account set --subscription "SUB_NAME"

id=$(((RANDOM%9999+1)))
prefix="cmk"
location="eastus"
resource_group="$prefix-key-vault-$id"
key_vault_name="$prefix-key-vault-$id"
vnet_name="$prefix-vnet-$id"
subnet_name="$vnet_name-1"
dns_zone_link="$prefix-zone-link-$id"
private_endpoint="$prefix-private-endpoint-$id"
private_link="$prefix-private-link-$id"


#Create an Azure Key Vault
az group create -n $resource_group -l $location
az keyvault create -n $key_vault_name -g $resource_group \
  -l $location --sku Standard

#Or if you have an existing key vault
resource_group="existing_key_vault_resource_group_name"
key_vault_name="existing_key_vault_name"

#Turn on the network firewall
az keyvault update --name $key_vault_name --resource-group $resource_group --default-action deny

#Create a VNet
az network vnet create \
 --name $vnet_name \
 --resource-group $resource_group \
 --subnet-name $subnet_name

#Update subnet
az network vnet subnet update \
 --name $subnet_name \
 --resource-group $resource_group \
 --vnet-name $vnet_name \
 --disable-private-endpoint-network-policies true

#Add private DNS zone
az network private-dns zone create \
  --resource-group $resource_group \
  --name privatelink.vaultcore.azure.net

#Link DNS zone to Vnet
az network private-dns link vnet create \
  --resource-group $resource_group \
  --virtual-network $vnet_name \
  --zone-name privatelink.vaultcore.azure.net \
  --name $dns_zone_link \
  --registration-enabled true

sub_id=$(az account show --query id -o tsv)

az network private-endpoint create \
  --resource-group $resource_group \
  --vnet-name $vnet_name \
  --subnet $subnet_name \
  --name $private_endpoint  \
  --private-connection-resource-id "/subscriptions/$sub_id/resourceGroups/$resource_group/providers/Microsoft.KeyVault/vaults/$key_vault_name" \
  --group-ids vault \
  --connection-name $private_link \
  --location $location

nic_id=$(az network private-endpoint show \
  -g $resource_group -n $private_endpoint \
  --query networkInterfaces[0].id -o tsv)

private_ip=$(az network nic show \
  --ids $nic_id \
  --query ipConfigurations[0].privateIpAddress -o tsv)

#Add private zone records
az network private-dns record-set a add-record \
  --resource-group $resource_group \
  --zone-name "privatelink.vaultcore.azure.net" \
  --record-set-name $key_vault_name \
  --ipv4-address $private_ip