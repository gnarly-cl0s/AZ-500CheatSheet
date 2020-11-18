<# Using the Azure AD PIM PowerShell module
#>

# Get 'er installed
Find-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule | Install-Module -Verbose -Force -AllowClobber

# Enumerate commands
Get-Command -Module Microsoft.Azure.ActiveDirectory.PIM.PSModule

# Update help (not that it will help)
Get-Help -Name Enable-PrivilegedRoleAssignment

# Authenticate first
Connect-PimService -UserName 'jason@timw.info'

# Enumerate eligible roles
Get-PrivilegedRoleAssignment

# Activate a role
$params = @{ 'RoleID' = '62e90394-69f5-4237-9190-012177145e10';
             'Reason' = 'Testing PowerShell';
             'Duration' = '0.5'
           }
Enable-PrivilegedRoleAssignment @params

# Remove elevation
Disable-PrivilegedRoleAssignment -RoleId '62e90394-69f5-4237-9190-012177145e10'