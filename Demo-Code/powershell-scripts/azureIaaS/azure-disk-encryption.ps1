$rgName = "keynervana"
$location = "South Central US"

Register-AzureRmResourceProvider -ProviderNamespace "Microsoft.KeyVault"
New-AzureRmResourceGroup -Location $location -Name $rgName

$keyVaultName = "psKeyVault7837"
New-AzureRmKeyVault -Location $location `
    -ResourceGroupName $rgName `
    -VaultName $keyVaultName `
    -EnabledForDiskEncryption

Add-AzureKeyVaultKey -VaultName $keyVaultName `
    -Name "ADEKEY" `
    -Destination "Software"
$appName = "ADE-APP"



$securePassword = ConvertTo-SecureString -String "" -AsPlainText -Force




$app = New-AzureRmADApplication -DisplayName $appName `
    -HomePage "https://ade.ps.local" `
    -IdentifierUris "https://ade.ps/ade" `
    -Password $securePassword
New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId

Set-AzureRmKeyVaultAccessPolicy -VaultName $keyvaultName `
    -ServicePrincipalName $app.ApplicationId `
    -PermissionsToKeys "WrapKey" `
    -PermissionsToSecrets "Set"

$keyVault = Get-AzureRmKeyVault -VaultName $keyVaultName -ResourceGroupName $rgName;
$diskEncryptionKeyVaultUrl = $keyVault.VaultUri;
$keyVaultResourceId = $keyVault.ResourceId;
$keyEncryptionKeyUrl = (Get-AzureKeyVaultKey -VaultName $keyVaultName -Name ADEKEY).Key.kid

Set-AzureRmVMDiskEncryptionExtension -ResourceGroupName $rgName `
    -VMName "managedserver" `
    -AadClientID $app.ApplicationId `
    -AadClientSecret (New-Object PSCredential "", $securePassword).GetNetworkCredential().Password `
    -DiskEncryptionKeyVaultUrl $diskEncryptionKeyVaultUrl `
    -DiskEncryptionKeyVaultId $keyVaultResourceId `
    -KeyEncryptionKeyUrl $keyEncryptionKeyUrl `
    -KeyEncryptionKeyVaultId $keyVaultResourceId


Get-AzureRmVmDiskEncryptionStatus  -ResourceGroupName $rgName -VMName "managedserver"
