# Load up the Azure PowerShell modules
Install-Module -Name AzureRM -Verbose -Force

# Start VMs
Start-AzureRmVm -Name '' -ResourceGroupName ''

# Stop VM
Get-Azurermvm -ResourceGroupName '' | Stop-AzureRmVm -Force

# Resize VM
$resourceGroup = ''
$vmName = ''

Get-AzureRmVMSize -Location 'southcentralus' | Out-GridView

Get-AzureRmVMSize -ResourceGroupName $resourceGroup -VMName $vmName

$vm = Get-AzureRmVM -ResourceGroupName $resourceGroup -VMName $vmName

$vm.HardwareProfile.VmSize = ''

Update-AzureRmVM -VM $vm -ResourceGroupName $resourceGroup
