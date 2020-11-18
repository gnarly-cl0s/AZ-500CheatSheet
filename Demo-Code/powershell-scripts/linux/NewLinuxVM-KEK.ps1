#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

#Set some basic variables
$prefix = "Az500"
$Location = "eastus2"
$id = Get-Random -Minimum 1000 -Maximum 9999
$ResourceGroupName = "$prefix-linux-vm-$id"
$kekResourceGroupName = "$prefix-kek-vault-$id"


#Create the necessary resource groups
$vmRG = New-AzResourceGroup -Name $ResourceGroupName -Location $Location
$kekRG = New-AzResourceGroup -Name $kekResourceGroupName -Location $Location

#Create a new Key Vault for the VMs
$keyVaultParameters = @{
    Name = "$prefix-key-vault-$id"
    ResourceGroupName = $ResourceGroupName
    Location = $location
    EnabledForDiskEncryption = $true
    EnabledForDeployment = $true
    Sku = "Standard"
}
$keyVault = New-AzKeyVault @keyVaultParameters

#Create a new Key Vault for the KEK
$kekVaultParameters = @{
    Name = "$prefix-kek-$id"
    ResourceGroupName = $kekResourceGroupName
    Location = $location
    EnabledForDiskEncryption = $true
    EnabledForDeployment = $true
    Sku = "Premium"
}
$kekVault = New-AzKeyVault @kekVaultParameters

#Create a Key Encryption Key
$kekName = "$prefix-kek"
$kek = Add-AzKeyVaultKey -VaultName $kekVault.VaultName -Name $kekName -Destination 'HSM'

#Let's create a new Linux VM that we will encrypt
$LinuxVMParameters = @{
    adminUsername = "linuxadmin"
    adminPasswordOrKey = 'GEN_ADM_PASSWORD'
    authenticationType = "password"
    dnsName = "$prefix$id"
    vmName = "$prefix-linux-vm"
    keyVaultName = $keyVault.VaultName
    keyVaultResourceGroup = $keyVault.ResourceGroupName
    keyEncryptionKeyURL = $kek.Key.kid
    keyEncryptionKeyVaultName = $kekVault.VaultName
    kekVaultResourceGroup = $kekRG.ResourceGroupName
    volumeType = "OS"
}

New-AzResourceGroupDeployment -Name "linuxVM" -ResourceGroupName $ResourceGroupName -TemplateParameterObject $LinuxVMParameters -TemplateFile .\m4\LinuxVM\linux-vm-data-disk.json -Mode Incremental

#Once creation is finished, check on the encryption status of the VM
Get-AzVmDiskEncryptionStatus -ResourceGroupName $vmRG.ResourceGroupName -VMName $LinuxVMParameters["VMName"]
