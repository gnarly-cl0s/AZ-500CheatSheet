# Set variables
$resourceGroup = 'LB'
$vmName = 'web1'
$newAvailSetName = 'web'

# Get VM Details
$originalVM = Get-AzureRmVm `
    -ResourceGroupName $resourceGroup `
    -Name $vmName

# Remove the original VM
Remove-AzureRmVM -ResourceGroupName $resourceGroup -Name $vmName

# Create new availability set if it does not exist
$availSet = Get-AzureRmAvailabilitySet `
    -ResourceGroupName $resourceGroup `
    -Name $newAvailSetName `
    -ErrorAction Ignore
if (-Not $availSet) {
    $availSet = New-AzureRmAvailabilitySet `
        -Location $originalVM.Location `
        -Name $newAvailSetName `
        -ResourceGroupName $resourceGroup `
        -PlatformFaultDomainCount 2 `
        -PlatformUpdateDomainCount 2 `
        -Sku Aligned
}

# Create the basic configuration for the replacement VM
$newVM = New-AzureRmVMConfig `
    -VMName $originalVM.Name `
    -VMSize $originalVM.HardwareProfile.VmSize `
    -AvailabilitySetId $availSet.Id

Set-AzureRmVMOSDisk `
    -VM $newVM -CreateOption Attach `
    -ManagedDiskId $originalVM.StorageProfile.OsDisk.ManagedDisk.Id `
    -Name $originalVM.StorageProfile.OsDisk.Name `
    -Windows

# Add Data Disks
foreach ($disk in $originalVM.StorageProfile.DataDisks) {
    Add-AzureRmVMDataDisk -VM $newVM `
        -Name $disk.Name `
        -ManagedDiskId $disk.ManagedDisk.Id `
        -Caching $disk.Caching `
        -Lun $disk.Lun `
        -DiskSizeInGB $disk.DiskSizeGB `
        -CreateOption Attach
}

# Add NIC(s)
foreach ($nic in $originalVM.NetworkProfile.NetworkInterfaces) {
    Add-AzureRmVMNetworkInterface `
        -VM $newVM `
        -Id $nic.Id
}

# Recreate the VM
New-AzureRmVM `
    -ResourceGroupName $resourceGroup `
    -Location $originalVM.Location `
    -VM $newVM `
    -DisableBginfoExtension