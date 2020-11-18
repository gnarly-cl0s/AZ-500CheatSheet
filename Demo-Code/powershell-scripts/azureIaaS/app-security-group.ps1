# Ref: https://blog.kloud.com.au/2017/11/21/azure-application-security-groups/

$webAsg = New-AzureRmApplicationSecurityGroup -ResourceGroupName AppGatewayWAF -Name webAsg -Location southcentralus

$sqlAsg = New-AzureRmApplicationSecurityGroup -ResourceGroupName AppGatewayWAF -Name sqlAsg -Location southcentralus

$webRule = New-AzureRmNetworkSecurityRuleConfig `
    -Name "AllowHttps" `
    -Access Allow `
    -Protocol Tcp `
    -Direction outbound `
    -Priority 1500 `
    -SourceApplicationSecurityGroupId $webAsg.id `
    -SourcePortRange * `
    -DestinationAddressPrefix VirtualNetwork `
    -DestinationPortRange 443

$sqlRule = New-AzureRmNetworkSecurityRuleConfig `
    -Name "AllowSql" `
    -Access Allow `
    -Protocol Tcp `
    -Direction outbound `
    -Priority 1000 `
    -SourceApplicationSecurityGroupId $sqlAsg.id `
    -SourcePortRange * `
    -DestinationAddressPrefix VirtualNetwork `
    -DestinationPortRange 1433

$nsg = New-AzureRmNetworkSecurityGroup -ResourceGroupName AppGatewayWAF -Location southcentralus -Name asgTestnsg -SecurityRules $webRule, $sqlRule

$vnet = Get-AzureRmVirtualNetwork -Name MyVNet -ResourceGroupName AppGatewayWAF
Set-AzureRmVirtualNetworkSubnetConfig -Name default -VirtualNetwork $vnet -NetworkSecurityGroupId $nsg.Id -AddressPrefix '10.0.0.0/16'
Set-AzureRmVirtualNetwork -VirtualNetwork $vnet

$webNic = Get-AzureRmNetworkInterface -Name vm1Nic -ResourceGroupName AppGatewayWAF
$webNic.IpConfigurations[0].ApplicationSecurityGroups = $webAsg
Set-AzureRmNetworkInterface -NetworkInterface $webNic

$sqlNic = Get-AzureRmNetworkInterface -Name vm2Nic -ResourceGroupName AppGatewayWAF
$sqlNic.IpConfigurations[0].ApplicationSecurityGroups = $sqlAsg
Set-AzureRmNetworkInterface -NetworkInterface $sqlNic