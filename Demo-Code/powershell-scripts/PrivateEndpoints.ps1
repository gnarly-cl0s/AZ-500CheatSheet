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
    Sku = "Standard"
}

$keyVault = New-AzKeyVault @keyVaultParameters

#If you already have a Key Vault
$keyVault = Get-AzKeyVault -VaultName "cmk-key-vault-7373" -ResourceGroupName "cmk-key-vault-7373"

#Turn on the network firewall
Update-AzKeyVaultNetworkRuleSet -VaultName $keyVault.VaultName -DefaultAction Deny

#Create a VNet
$vNetParameters = @{
    ResourceGroupName = $keyVaultGroup.ResourceGroupName
    Location = $location
    Name = "$prefix-vnet-$id"
    AddressPrefix = "10.0.0.0/16"
}

$virtualNetwork = New-AzVirtualNetwork @vNetParameters

$subnetParameters = @{
    Name = "$prefix-subnet-$id"
    AddressPrefix = "10.0.0.0/24"
    VirtualNetwork = $virtualNetwork
    PrivateEndpointNetworkPoliciesFlag = "Disabled"
    PrivateLinkServiceNetworkPolicies = "Enabled"
}

$subnetConfig = Add-AzVirtualNetworkSubnetConfig @subnetParameters

$virtualNetwork | Set-AzVirtualNetwork

#Add private DNS zone
$zone = New-AzPrivateDnsZone -Name privatelink.vaultcore.azure.net -ResourceGroupName $keyVaultGroup.ResourceGroupName

#Link DNS zone to Vnet
$linkParameters = @{
  ResourceGroupName = $keyVaultGroup.ResourceGroupName
  Name = "$prefix-zone-link-$id"
  VirtualNetworkId = $virtualNetwork.Id
  EnableRegistration = $true
  ZoneName = "privatelink.vaultcore.azure.net"
}

$link = New-AzPrivateDnsVirtualNetworkLink @linkParameters

#Create connection and endpoint
$endpointConnectionParameters = @{
  Name = "$prefix-private-connection-$id"
  PrivateLinkServiceId = $keyVault.ResourceId
  GroupId = "vault"
}

$connection = New-AzPrivateLinkServiceConnection @endpointConnectionParameters

$virtualNetwork = Get-AzVirtualNetwork -Name $virtualNetwork.Name -ResourceGroupName $keyVaultGroup.ResourceGroupName
$subnet = $virtualNetwork | Select -ExpandProperty Subnets | Where-Object  {$_.Name -eq "$prefix-subnet-$id"}

$endpointParameters = @{
  Name = "$prefix-private-endpoint-$id"
  ResourceGroupName = $keyVaultGroup.ResourceGroupName
  Location = $location
  Subnet = $subnet
  PrivateLinkServiceConnection = $connection
}

$endPoint = New-AzPrivateEndpoint @endpointParameters

#Add private zone records
$config = New-AzPrivateDnsZoneConfig -Name "privatelink.vault.windows.net" -PrivateDnsZoneId $zone.ResourceId

$zoneGroupParameters = @{
  ResourceGroupName = $keyVaultGroup.ResourceGroupName
  PrivateEndpointName = $endPoint.Name
  Name = "$prefix-zone-group-$id"
  PrivateDnsZoneConfig = $config
}

$privateDnsZoneGroup = New-AzPrivateDnsZoneGroup @zoneGroupParameters
