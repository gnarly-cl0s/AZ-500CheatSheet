#Log into Azure
Add-AzAccount

#Select the correct subscription
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

#Set some basic variables
$prefix = "css"
$Location = "eastus"

#Get the RG for the Vnet
$RG = Get-AzResourceGroup -Name "Networking"

#Create a default NSG
$NSG = New-AzNetworkSecurityGroup -Name "$prefix-default-subnet" -ResourceGroupName $RG.ResourceGroupName -Location $Location

#Get the VNet
$Vnet = Get-AzVirtualNetwork -Name "VNet1" -ResourceGroupName $RG.ResourceGroupName

#Check if each has an NSG, if not apply one
foreach($subnet in $Vnet.Subnets){
    if($subnet.NetworkSecurityGroup -eq $null){
        Write-Output "$($subnet.Name) has no NSG"
        Set-AzVirtualNetworkSubnetConfig -Name $subnet.Name -VirtualNetwork $Vnet -NetworkSecurityGroupId $NSG.Id -AddressPrefix $subnet.AddressPrefix
    }
}

$Vnet | Set-AzVirtualNetwork