# Housekeeping tasks for each VM
Set-ExecutionPolicy -ExecutionPolicy Bypass -Force
New-NetFirewallRule -DisplayName 'Allow ICMPv4-In' -Protocol 'ICMPv4'
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value * -Force

# Set variables
$rgName = 'vnet'
$zoneName = 'hacktivity.pri'
$host1ip = '192.168.1.1'
$host1Name = 'host1'
$host2Name = 'host2'
$host2ip = '10.0.0.4'
$vnet1Name = 'vnet1'

$vnet2Name = 'vnet2'

$vnet1 = Get-AzureRmVirtualNetwork -Name $vnet1Name -ResourceGroupName $rgName
$vnet2 = Get-AzureRmVirtualNetwork -Name $vnet2Name -ResourceGroupName $rgName

New-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName `
   -ZoneType Private -RegistrationVirtualNetworkId @($vnet1.Id)

New-AzureRmDnsRecordSet -Name $host1Name -RecordType A -ZoneName $zoneName `
 -ResourceGroupName $rgName -Ttl 3600 `
 -DnsRecords (New-AzureRmDnsRecordConfig -IPv4Address $host1IP)

New-AzureRmDnsRecordSet -Name $host2Name -RecordType A `
 -ZoneName $zoneName -ResourceGroupName $rgName `
 -Ttl 3600 -DnsRecords (New-AzureRmDnsRecordConfig -IPv4Address $host2IP)

Get-AzureRmDnsRecordSet -ZoneName $zoneName -ResourceGroupName $rgName

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName `
 -RegistrationVirtualNetworkId @($vnet1.Id)

Set-AzureRmDnsZone -Name $zoneName -ResourceGroupName $rgName `
 -ResolutionVirtualNetworkId @($vnet2.Id)