$rgName = 'myResourceGroup'

$vmName = 'myVM'

Stop-AzureRmVM -ResourceGroupName $rgName -Name $vmName -Force

ConvertTo-AzureRmVMManagedDisk -ResourceGroupName $rgName -VMName $vmName