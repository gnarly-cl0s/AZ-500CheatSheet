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

#Get the existing custom roles
Get-AzRoleDefinition | Where-Object {$_.IsCustom -eq $True} | Format-Table Name, IsCustom

#Create a new custom role definition for Key Vault
$subId = (Get-AzContext).Subscription.Id

$roleInfo = Get-Content .\custom_role.json

$roleInfo -replace "SUBSCRIPTION_ID",$subId > updated_role.json

$role = New-AzRoleDefinition -InputFile .\updated_role.json

#Assign the custom role to an existing user
$user = Get-AzADUser -UserPrincipalName "USER_PRINCIPAL_NAME"

$assignmentInfo = @{
    ObjectId = $user.Id
    Scope = $keyVault.ResourceId
    RoleDefinitionId = $role.Id
}

New-AzRoleAssignment @assignmentInfo

Get-AzRoleAssignment -Scope $keyVault.ResourceId

