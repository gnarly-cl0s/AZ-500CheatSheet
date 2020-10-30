# Get Azure Management Groups
Get-AzManagementGroup | select DisplayName

# Retrieve all locks in connected subscription
Get-AzResourceLock

# Create hashtable for splatting
$arguments = @{
    LockName          = 'dontdeleteme'
    LockLevel         = 'CanNotDelete'
    ResourceGroupName = 'demo-rg'
}


# Create new resource lock
New-AzResourceLock @arguments -Verbose -Force

# or
New-AzResourceLock -LockName 'dontdeleteme' -LockLevel CanNotDelete -ResourceGroupName 'demo-rg'

# View new resource lock
Get-AzResourceLock

# Delete resource locks (warning, this will delete all locks in subscription)
Get-AzResourceLock | Remove-AzResourceLock

# Create Custom Role
$role = Get-AzRoleDefinition "Virtual Machine Contributor"
$role.Id = $null
$role.Name = "Virtual Machine Monitorer"
$role.Description = "Can monitor and restart virtual machines."
$role.Actions.Clear()
$role.Actions.Add("Microsoft.Storage/*/read")
$role.Actions.Add("Microsoft.Network/*/read")
$role.Actions.Add("Microsoft.Compute/*/read")
$role.Actions.Add("Microsoft.Compute/virtualMachines/start/action")
$role.Actions.Add("Microsoft.Compute/virtualMachines/restart/action")
$role.Actions.Add("Microsoft.Authorization/*/read")
$role.Actions.Add("Microsoft.ResourceHealth/availabilityStatuses/read")
$role.Actions.Add("Microsoft.Resources/subscriptions/resourceGroups/read")
$role.Actions.Add("Microsoft.Insights/alertRules/*")
$role.Actions.Add("Microsoft.Support/*")
$role.AssignableScopes.Clear()
$role.AssignableScopes.Add("/subscriptions/8bc4fbf0-6ad5-4922-aaaa-226b44e5db84")

New-AzRoleDefinition -Role $role



