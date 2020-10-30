<#
 This snippet allows to replace existing network interface of Azure RM VM with another network interface.
 Assumptions: 
  1) You successfully login to your Azure RM with Login-AzureRmAccount cmdlet
  2) New NIC is already created
  3) All resources (VM and both NICs) are deployed into the same resource group

  Reference: https://prosharepoint.ru/replace-existing-nic-of-azure-virtual-machine-arm-with-powershell/
#>
$ResourceGroup = "ResourceGroupName"
$VM = "VM-Name"
$NewNICName = "NewNICName"

$VM = Get-AzureRmVM -Name $VM -ResourceGroupName $ResourceGroup
$NewNIC =  Get-AzureRmNetworkInterface -Name $NewNICName -ResourceGroupName $ResourceGroup
$VM = Add-AzureRmVMNetworkInterface -VM $VM -Id $NewNIC.Id
$VM.NetworkProfile.NetworkInterfaces.Item(1).Primary = $true
$VM.NetworkProfile.NetworkInterfaces.RemoveAt(0)
Update-AzureRmVM -VM $VM -ResourceGroupName $ResourceGroup