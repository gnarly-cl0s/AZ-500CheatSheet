# Assign Azure AD Roles

# Authenticate to Azure AD
Connect-AzureAD

# Enumerate commands
Get-Command -Module AzureAD -noun AzureAD*role*

# Play with roles ("Where is ____ role?!")
Get-AzureADDirectoryRole | Select-Object -Property DisplayName, Description | Sort-Object -Property DisplayName

Get-AzureADDirectoryRoleTemplate | Select-Object -Property DisplayName, Description | Sort-Object -Property DisplayName

$RoleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object { $_.DisplayName -eq "Power BI Service Administrator" }
Enable-AzureADDirectoryRole -RoleTemplateId $RoleTemplate.ObjectId

# Ref: https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/roles-assign-powershell

# Fetch user to assign to role
$roleMember = Get-AzureADUser -ObjectId "batman@onmicrosoft.com"

# Fetch User Account Administrator role instance
$role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq 'Power BI Service Administrator' }

# If role instance does not exist, instantiate it based on the role template
if ($role -eq $null) {
    # Instantiate an instance of the role template
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object { $_.displayName -eq 'User Account Administrator' }
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId

    # Fetch User Account Administrator role instance again
    $role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq 'User Account Administrator' }
}

# Add user to role
Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $roleMember.ObjectId

# Fetch role membership for role to confirm
Get-AzureADDirectoryRoleMember -ObjectId $role.ObjectId | Get-AzureADUser