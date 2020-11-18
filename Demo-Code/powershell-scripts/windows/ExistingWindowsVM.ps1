#Prefix for resources
$prefix = "Az500"

#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

#Let's create an existing Windows VM that we will encrypt
$Location = "eastus2"
$id = Get-Random -Minimum 1000 -Maximum 9999
$ResourceGroupName = "$prefix-windows-vm-$id"
$VMName = "$prefix-win-vm-$id"

$WinVMParameters = @{
    adminUsername = "winadmin"
    adminPassword = 'GEN_ADM_PASSWORD'
    dnsName = "$prefix$id"
    vmName = $VMName
}

#Create the resource group for the VM
$vmRG = New-AzResourceGroup -Name $ResourceGroupName -Location $Location

#Deploy the #Windows VM template
New-AzResourceGroupDeployment -Name "winVM" -ResourceGroupName $ResourceGroupName -TemplateParameterObject $WinVMParameters -TemplateFile .\m4\WindowsVM\windows-vm-data-disk.json -Mode Incremental

#Log into the VM and initialize/format the data disk

#Now provision a Key Vault if you don't already have one

#Create a new Key Vault
$keyVaultParameters = @{
    Name = "$prefix-key-vault-$id"
    ResourceGroupName = $vmRG.ResourceGroupName
    Location = $location
    EnabledForDiskEncryption = $true
    EnabledForDeployment = $true
    Sku = "Standard"
}
$keyVault = New-AzKeyVault @keyVaultParameters

#Set the disk encryption settings for the Windows VM
$DiskEncryptionParameters = @{
    ResourceGroupName = $vmRG.ResourceGroupName
    VMname = $VMName
    DiskEncryptionKeyVaultUrl = $keyVault.VaultUri
    DiskEncryptionKeyVaultId = $keyVault.ResourceId
    VolumeType = "All"
}

Set-AzVMDiskEncryptionExtension @DiskEncryptionParameters

#Check the encryption settings once the command completes
Get-AzVmDiskEncryptionStatus -ResourceGroupName $vmRG.ResourceGroupName -VMName $VMName

