#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

#Set some basic variables
$prefix = "Az500"
$Location = "eastus2"
$id = Get-Random -Minimum 1000 -Maximum 9999
$ResourceGroupName = "$prefix-recovery-vault-$id"


#Create the necessary resource groups
$rvRG = New-AzResourceGroup -Name $ResourceGroupName -Location $Location

#Create the Recovery Vault
$RecoveryVaultParameters = @{
    Name = "$prefix-vault-$id"
    ResourceGroupName = $ResourceGroupName
    Location = $Location
}

$rv = New-AzRecoveryServicesVault @RecoveryVaultParameters

#Grant Recovery Vault access to Key Vault
$VaultName = "KEY_VAULT_NAME"
$VaultResourceGroup = "KEY_VAULT_RESOURCE_GROUP"

$VaultPolicyParameters = @{
    VaultName = $VaultName
    ResourceGroupName = $VaultResourceGroup
    PermissionsToKeys = @("backup","get","list")
    PermissionsToSecrets = @("backup","get","list")
    ServicePrincipalName = "262044b1-e2ce-469f-a196-69ab7ada62d3"
}

Set-AzKeyVaultAccessPolicy @VaultPolicyParameters

#Configure Backup of Windows VM
$pol = Get-AzRecoveryServicesBackupProtectionPolicy -WorkloadType "AzureVM" -VaultId $rv.ID
$VMName = "WIN_VM_NAME"
$VMResourceGroup = "VM_RESOURCE_GROUP"
Enable-AzRecoveryServicesBackupProtection -Policy $pol -Name $VMName -ResourceGroupName $VMResourceGroup -VaultId $rv.ID

$container = Get-AzRecoveryServicesBackupContainer -VaultId $rv.id -ContainerType AzureVM -FriendlyName $VMName
$item = Get-AzRecoveryServicesBackupItem -Container $container -WorkloadType "AzureVM"
$endDate = (Get-Date).AddDays(60).ToUniversalTime()
$job = Backup-AzRecoveryServicesBackupItem -Item $item -VaultId $rv.ID -ExpiryDateTimeUTC $endDate

#Once Backup is complete we can do a restore

#First create a storage account for the restored VHD
$saName = "recovered$prefix$id".ToLower()

$saParameters = @{
    ResourceGroupName = $ResourceGroupName
    Name = $saName
    SkuName = "Standard_LRS"
    Location = $Location
}
$sa = New-AzStorageAccount @saParameters

#Complete restore and recovery in portal
