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

#Create an access policy for keys and secrets using policy
$backupPolicyParameters = @{
    VaultName = $keyVault.VaultName
    ResourceGroupName = $keyVault.ResourceGroupName
    PermissionsToKeys = @("backup","get","list")
    PermissionsToSecrets = @("backup","get","list")
    ServicePrincipalName = "262044b1-e2ce-469f-a196-69ab7ada62d3"
}

Set-AzKeyVaultAccessPolicy @backupPolicyParameters