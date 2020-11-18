# Device Code login - Provides a link to sign into Azure via your web browser
Connect-AzAccount

# Service Principal login - Use a previously created service principal to log in
Connect-AzAccount -ServicePrincipal -ApplicationId 'http://my-app' -Credential $PSCredential -TenantId $TenantId

# Gets the Azure PowerShell context for the current PowerShell session
Get-AzContext

# Lists all available Azure PowerShell contexts in the current PowerShell session
Get-AzContext -ListAvailable

# Get all of the Azure subscriptions in your current Azure tenant
Get-AzSubscription

# Get all of the Azure subscriptions in a specific Azure tenant
Get-AzSubscription -TenantId $TenantId

# Set the Azure PowerShell context to a specific Azure subscription
Set-AzContext -Subscription $SubscriptionName -Name 'MyContext'

# Set the Azure PowerShell context using piping
Get-AzSubscription -SubscriptionName $SubscriptionName | Set-AzContext -Name 'MyContext'

# List all cmdlets in the Az.Accounts module
Get-Command -Module Az.Accounts

# List all cmdlets that contain VirtualNetwork
Get-Command -Name '*VirtualNetwork*'

# List all cmdlets that contain VM in the Az.Compute module
Get-Command -Module Az.Compute -Name '*VM*'

# View the basic help content for Get-AzSubscription
Get-Help -Name Get-AzSubscription

# View the examples for Get-AzSubscription
Get-Help -Name Get-AzSubscription -Examples

# View the full help content for Get-AzSubscription
Get-Help -Name Get-AzSubscription -Full

# View the help content for Get-AzSubscription on https://docs.microsoft.com
Get-Help -Name Get-AzSubscription -Online