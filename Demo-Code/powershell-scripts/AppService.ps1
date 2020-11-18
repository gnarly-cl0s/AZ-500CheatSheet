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
$keyVault = Get-AzKeyVault -VaultName "VAULT_NAME" -ResourceGroupName "RESOURCE_GROUP_NAME"

#Create an App Service instance
$appServiceGroup = New-AzResourceGroup -Name "$prefix-app-service-$id" -Location $location

$appServiceParameters = @{
    prefix = $prefix
    id = $id.ToString()
}

$appServiceDeploymentParameters = @{
    Name = "AppServiceDeploy"
    ResourceGroupName = $appServiceGroup.ResourceGroupName
    TemplateFile = ".\AppService.json"
    TemplateParameterObject = $appServiceParameters
    Mode = "Incremental"
}

$appServiceDeployment = New-AzResourceGroupDeployment @appServiceDeploymentParameters

#Grant App Service access to Key Vault
$accessPolicySettings = @{
    VaultName = $keyVault.VaultName
    ResourceGroupName = $keyVault.ResourceGroupName
    PermissionsToSecrets = @("get")
    ObjectId = $appServiceDeployment.Outputs.principalId.Value
}

Set-AzKeyVaultAccessPolicy @accessPolicySettings

#Store a secret in Key Vault for App Service to retrieve
$secretValue =  ConvertTo-SecureString -String "ContosoSuperSecret" -AsPlainText -Force
Set-AzKeyVaultSecret -VaultName $keyVault.VaultName -Name "webappsecret" -SecretValue $secretValue

Write-Output $keyVault.VaultName
