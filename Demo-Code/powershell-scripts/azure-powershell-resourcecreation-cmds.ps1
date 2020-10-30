#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

#Set some basic variables
$prefix = "css"
$Location = "eastus"
$id = Get-Random -Minimum 1000 -Maximum 9999

#Now let's create the App Service
$appServiceRGName = "$prefix-appService-$id"


#Create the necessary resource groups
$appServiceRG = New-AzResourceGroup -Name $appServiceRGName -Location $Location

#Define parameter values for the ARM template
$appServiceParameters = @{
    webAppName = "$prefix-$id"
}

$appServiceDeploymentParameters = @{
    Name = "AppServiceDeploy"
    ResourceGroupName = $appServiceRG.ResourceGroupName
    TemplateFile = ".\app-service\azuredeploy.json"
    TemplateParameterObject = $appServiceParameters
    Mode = "Incremental"
}

New-AzResourceGroupDeployment @appServiceDeploymentParameters

#Now let's create the Windows VM
$winVMRGName = "$prefix-winvm-$id"

#Create the necessary resource groups
$winVMRG = New-AzResourceGroup -Name $winVMRGName -Location $Location

#Define parameter values for the ARM template
$winVMParameters = @{
    adminUsername = "winadmin"
    adminPassword = 'n6Uz^)N.d!j+uE'
    dnsLabelPrefix = "$($prefix)win$id"
}

$winVMDeploymentParameters = @{
    Name = "winVMDeploy"
    ResourceGroupName = $winVMRG.ResourceGroupName
    TemplateFile = ".\windows-vm\azuredeploy.json"
    TemplateParameterObject = $winVMParameters
    Mode = "Incremental"
}

New-AzResourceGroupDeployment @winVMDeploymentParameters

#Now let's create the Linux VM
$linuxVMRGName = "$prefix-linuxvm-$id"

#Create the necessary resource groups
$linuxVMRG = New-AzResourceGroup -Name $linuxVMRGName -Location $Location

#Define parameter values for the ARM template
$linuxVMParameters = @{
    adminUsername = "linuxadmin"
    authenticationType = "password"
    adminPasswordOrKey = 'n6Uz^)N.d!j+uE'
    dnsLabelPrefix = "$($prefix)linux$id"
}

$linuxVMDeploymentParameters = @{
    Name = "winVMDeploy"
    ResourceGroupName = $linuxVMRG.ResourceGroupName
    TemplateFile = ".\linux-vm\azuredeploy.json"
    TemplateParameterObject = $linuxVMParameters
    Mode = "Incremental"
}

New-AzResourceGroupDeployment @linuxVMDeploymentParameters

#Create a resource group for Key Vault
$keyVaultGroup = New-AzResourceGroup -Name "$prefix-key-vault-$id" -Location $location

#Create a new Key Vault
$keyVaultParameters = @{
    Name = "$prefix-key-vault-$id"
    ResourceGroupName = $keyVaultGroup.ResourceGroupName
    Location = $location
    Sku = "Standard"
}

New-AzKeyVault @keyVaultParameters