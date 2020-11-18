# prerequisites
Install-Module -Name Az -AllowClobber -Scope CurrentUser

# connect to Azure
Connect-AzAccount
Select-AzSubscription "<YOUR_SUBSCRIPTION_ID>"

# 1 Create SSH key pair
# 2 Create a resource group if need
New-AzResourceGroup -Name "Battlefield" -Location "EastUS2"

# 3 Create virtual network resources
# Create a subnet configuration
$subnetConfig = New-AzVirtualNetworkSubnetConfig `
  -Name "Attack" `
  -AddressPrefix 10.0.1.0/24
$subnetConfig2 = New-AzVirtualNetworkSubnetConfig `
  -Name "Management" `
  -AddressPrefix 10.0.2.0/24
# Create a virtual network
$vnet = New-AzVirtualNetwork `
  -ResourceGroupName "Battlefield" `
  -Location "EastUS2" `
  -Name "Battlefield-Vnet" `
  -AddressPrefix 10.0.0.0/16 `
  -subnet $subnetConfig,$subnetConfig2
# Create a public IP address and specify a DNS name
$pubip = New-AzPublicIpAddress `
  -ResourceGroupName "Battlefield" `
  -Location "EastUS2" `
  -AllocationMethod Dynamic `
  -IdleTimeoutInMinutes 4 `
  -Name "cowrie-pip$(Get-Random)"

# 4 Create an Azure Network Security Group and traffic rules
# Create an inbound network security group rule for port 22
$nsgRuleSSH = New-AzNetworkSecurityRuleConfig `
  -Name "CowrieNetworkSecurityGroupRuleSSH"  `
  -Protocol "Tcp" `
  -Direction "Inbound" `
  -Priority 1000 `
  -SourceAddressPrefix * `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 22 `
  -Access "Allow"
# Create an inbound network security group rule for port 80 as another example
$nsgRuleWeb = New-AzNetworkSecurityRuleConfig `
  -Name "CowrieNetworkSecurityGroupRuleWWW"  `
  -Protocol "Tcp" `
  -Direction "Inbound" `
  -Priority 1001 `
  -SourceAddressPrefix * `
  -SourcePortRange * `
  -DestinationAddressPrefix * `
  -DestinationPortRange 80 `
  -Access "Allow"
# Create a network security group
$nsg = New-AzNetworkSecurityGroup `
  -ResourceGroupName "Battlefield" `
  -Location "EastUS2" `
  -Name "CowrieNetworkSecurityGroup" `
  -SecurityRules $nsgRuleSSH,$nsgRuleWeb

# 5 Create a virtual network card and associate with public IP address and NSG
$nic = New-AzNetworkInterface `
  -Name "CowrieNic" `
  -ResourceGroupName "Battlefield" `
  -Location "EastUS2" `
  -SubnetId $vnet.Subnets[0].Id `
  -PublicIpAddressId $pubip.Id `
  -NetworkSecurityGroupId $nsg.Id

# 6 Define a credential object
$securePassword = ConvertTo-SecureString ' ' -AsPlainText -Force
$cred = New-object System.Management.Automation.PSCredential ("azureuser", $securePassword)

# 7 Create a virtual machine configuration
$vmConfig = New-AzVMConfig `
  -VMName "Cowrie-HoneyPot" `
  -VMSize "Standard_B1s" | `
Set-AzVMOperatingSystem `
  -Linux `
  -ComputerName "Cowrie" `
  -Credential $cred `
  -DisablePasswordAuthentication | `
Set-AzVMSourceImage `
  -PublisherName "Canonical" `
  -Offer "UbuntuServer" `
  -Skus "18.04-LTS" `
  -Version "latest" | `
Add-AzVMNetworkInterface `
  -Id $nic.Id

# 8 Configure the SSH key
$sshPublicKey = ""
Add-AzVMSshPublicKey `
  -VM $vmconfig `
  -KeyData $sshPublicKey `
  -Path "/home/azureuser/.ssh/authorized_keys"

# 9 Now, combine the previous configuration definitions to create with New-AzVM:
New-AzVM `
  -ResourceGroupName "Battlefield" `
  -Location EastUS2 -VM $vmConfig

# 10 Get public Ip to connect
Get-AzPublicIpAddress -ResourceGroupName "Battlefield" | Select "IpAddress"
