# Azure Security Engineer Study Guide Prep For AZ-500 (30-35% Questions Pertain to this Domain)

## 1. Manage Azure Active Directory identities
Azure Active Directory Documentation - Tutorials, API Reference | Microsoft Docs
- [] https://docs.microsoft.com/en-us/azure/active-directory/
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles

### Configure security for service principals
- [] https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview

How to: Use Azure PowerShell to create a service principal with a certificate
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-authenticate-service-principal-powershell

Application and service principal objects in Azure Active Directory
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals

What are managed identities for Azure resources?
- [] https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview

### Manage Azure AD directory groups
- [] https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal <BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/groups-settings-v2-cmdlets<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-manage-groups<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-members-azure-portal<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/groups-create-rule

New-AzureADGroup (AzureAD) Syntax Options | Microsoft Docs
- [] https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureadgroup?view=azureadps-2.0

New-AzureADGroupAppRoleAssignment
- [] https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureadgroupapproleassignment?view=azureadps-2.0

### Manage Azure AD users
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/license-users-groups<BR>
- [] https://docs.microsoft.com/en-us/azure/billing/billing-add-change-azure-subscription-administrator<BR>

Add or delete users - Azure Active Directory | Microsoft Docs
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory

Creating a new user in Azure AD | Microsoft Docs
- [] https://docs.microsoft.com/en-us/powershell/azure/active-directory/new-user-sample?view=azureadps-2.0

New-AzureADUser (AzureAD) Syntax Options | Microsoft Docs
- [] https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?view=azureadps-2.0

Quickstart: Add guest users in the Azure portal 
- [] https://docs.microsoft.com/en-us/azure/active-directory/b2b/b2b-quickstart-add-guest-users-portal

Quickstart: Add a guest user with PowerShell
- [] https://docs.microsoft.com/en-us/azure/active-directory/external-identities/b2b-quickstart-invite-powershell

What is Azure Active Directory B2B collaboration? - Azure Active Directory | Microsoft Docs
- [] https://docs.microsoft.com/en-us/azure/active-directory/b2b/what-is-b2b

Add Azure Active Directory B2B collaboration users (Guest) in the Azure portal
- [] https://docs.microsoft.com/en-us/azure/active-directory/external-identities/add-users-administrator

Enable B2B external collaboration and manage who can invite guests
- [] https://docs.microsoft.com/en-us/azure/active-directory/external-identities/delegate-invitations

AzureAD | Microsoft Docs
- [] https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0

New-AzureADUserAppRoleAssignment
- [] https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduserapproleassignment?view=azureadps-2.0

### Configure password writeback
### Configure authentication methods including password hash and Pass Through
- [] https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-authentication-methods<BR>
- [] https://docs.microsoft.com/en-us/azure/security/fundamentals/choose-ad-authn

## 2. Authentication (PTA), OAuth, and passwordless

### Transfer Azure subscriptions between Azure AD tenants
- [] https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-subscriptions-associated-directory<BR>
- [] https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/billing-subscription-transfer<BR>
- [] https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/transfer-subscriptions-subscribers-csp<BR>
- [] https://docs.microsoft.com/en-us/azure/billing/billing-subscription-transfer


## 3. Configure secure access by using Azure AD

### Monitor privileged access for Azure AD Privileged Identity Management (PIM)
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-add-role-to-user<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-deployment-plan<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/azure-pim-resource-rbac<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-email-notifications
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-use-audit-log
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-configure-security-alerts

### Configure Access Reviews
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-overview-dashboards<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-perform-security-review<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-start-security-review<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/governance/create-access-review
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-start-access-review

### Activate and configure PIM
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-activate-role<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-getting-started#enable-pim
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/azure-ad-pim-approval-workflow
- [] https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-approval-workflow


License requirements to use PIM - Azure Active Directory | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/subscription-requirements

Getting started with Azure AD PIM PowerShell Module | GoToGuy Blog
https://gotoguy.blog/2018/05/22/getting-started-with-azure-ad-pim-powershell-module/


### Implement Conditional Access policies including Multi-Factor Authentication (MFA)
- [] https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-userdevicesettings<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/user-help/multi-factor-authentication-end-user-manage-settings<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/overview<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/plan-conditional-access<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/best-practices<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-policies<BR>
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/conditional-access-azure-management<BR>
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/overview

Multi-factor authentication (MFA) and PIM - Azure Active Directory | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-require-mfa

### Configure Azure AD identity protection
- [] https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-mfa-policy<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-risk-policies<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted<BR>
- [] https://www.microsoft.com/en-gb/security/technology/identity-access-management<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-policies
- [] https://docs.microsoft.com/en-us/azure/active-directory/governance/identity-governance-overview



## 4. Manage application access

### Create App Registration
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app<BR>
- [] https://docs.microsoft.com/en-us/graph/auth-register-app-v2<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-register-applications<BR>
- [] https://docs.microsoft.com/en-us/powerapps/developer/common-data-service/walkthrough-register-app-azure-active-directory

### Configure App Registration permission scopes
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent<BR>
- [] https://docs.microsoft.com/en-us/azure-stack/operator/azure-stack-create-service-principals

### Manage App Registration permission consent
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent<BR>
- [] https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration

### Manage API access to Azure subscriptions and resources
- [] https://docs.microsoft.com/en-us/azure/active-directory/develop/authentication-flows-app-scenarios<BR>
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-rest<BR>
- [] https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-manager-api-authentication<BR>
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal


## 5. Manage access control

### Configure subscription and resource permissions
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles
- [] https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-assign-admin-roles 


### Configure resource group permissions
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/elevate-access-global-admin

### Configure custom RBAC roles
What is role-based access control (RBAC) for Azure resources? | Microsoft Docs
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/overview

Custom roles for Azure resources | Microsoft Docs
- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles

- [] https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell
- [] https://docs.microsoft.com/en-us/workplace-analytics/use/using-powershell-to-assign-roles


### Identify the appropriate role
### Apply principle of least privilege
### Interpret permissions
### Check access

# EXTRA
### Install and configure Azure AD Connect
- [] https://docs.microsoft.com/en-us/azure/active-directory/hybrid/whatis-azure-ad-connect<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-select-installation<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-express<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-custom<BR>
- [] https://auth0.com/docs/connections/enterprise/azure-active-directory/v2<BR>
- [] https://docs.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-accounts-permissions

IP Address Management (IPAM) | Microsoft Docs
https://docs.microsoft.com/en-us/windows-server/networking/technologies/ipam/ipam-top

Privileged Access Management for Active Directory Domain Services | Microsoft Docs
https://docs.microsoft.com/en-us/microsoft-identity-manager/pam/privileged-identity-management-for-active-directory-domain-services

Privileged access management in Office 365 | Microsoft Docs
https://docs.microsoft.com/en-us/office365/securitycompliance/privileged-access-management-overview

# Powershell Commands
https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7<BR>
### Getting AzureAD powershell module
```
install-module azuread
Install-Module -Name AzureAD -Repository PSGallery -Verbose
import-module azuread
```

```
Get-Module -ListAvailable AzureAD*
```

Get 'er installed
```
Find-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule | Install-Module -Verbose -Force -AllowClobber
```

Enumerate commands
```
Get-Command -Module Microsoft.Azure.ActiveDirectory.PIM.PSModule
```

Update help (not that it will help)
```
Get-Help -Name Enable-PrivilegedRoleAssignment
```

Authenticate first
```
Connect-PimService -UserName 'jason@timw.info'
```

Enumerate eligible roles
```
Get-PrivilegedRoleAssignment
```

Activate a role
```
$params = @{ 'RoleID' = '62e90394-69f5-4237-9190-012177145e10';
             'Reason' = 'Testing PowerShell';
             'Duration' = '0.5'
           }
Enable-PrivilegedRoleAssignment @params
```

Remove elevation
```
Disable-PrivilegedRoleAssignment -RoleId '62e90394-69f5-4237-9190-012177145e10'
```

Run the following command to connect to the tenant domain:
```
Connect-AzureAD -TenantDomain "<Tenant_Domain_Name>"
```

Authenticate to Azure AD
```
$AzureAdCred = Get-Credential
Connect-AzureAD -Credential $AzureAdCred
```

To connect to a specific environment of Azure Active Directory, use the AzureEnvironment parameter, as follows:
```
Connect-AzureAD -AzureEnvironment "AzureGermanyCloud"
```

PasswordProfile - Specifies the user's password profile. Note that the parameter type for this parameter is "PasswordProfile". in order to pass a parameter of this type, you first need to create a variable in PowerShell with that type. We can do that with the New-Object cmdlet:

```
"$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile"
```

Then you can proceed to set the value of the password in this variable:

```
"$PasswordProfile.Password = "<Password>""
```

To create the user, call the New-AzureADUser cmdlet with the parameter values:

```
"New-AzureADUser -AccountEnabled $True -DisplayName "First Last" -PasswordProfile $PasswordProfile -MailNickName "FirstL" -UserPrincipalName "FirstL@<Domain>.com""
```

Creating an Azure AD group
```
New-AzureADGroup -DisplayName DC -MailEnabled $false -MailNickName NotSet -SecurityEnabled $true
```

To retrieve all groups in the directory
```
get-azureadgroup
get-azureadgroup -ObjectId <OBJECT-ID>
Get-AzureADGroup -Filter "DisplayName eq 'string'"
```

Add a group member
```
"$group = Get-AzureADGroup -Filter "DisplayName eq 'DC'""

Get-AzureADGroupMember -ObjectId $group.ObjectId

Get-AzureADUser | Where-Object -FilterScript { $_.UserType -eq 'Member' } |
Select-Object -Property objectId, DisplayName

Add-AzureADGroupMember -ObjectId $group.ObjectId `
    -RefObjectId "<objectId from previous get command>"
```

Update an exisiting group
```
Set-AzureADGroup -ObjectId <Object-ID> -<field to change>
```

Delete groups or Remove members
```
Remove-AzureADGroup -ObjectId <Object-ID>
Remove-AzureADGroupMember -ObjectId <Object-ID> -MemberId <Member-ID>
```

Assign the Guest Inviter role to a user
```
Add-MsolRoleMember -RoleObjectId 95e79109-95c0-4d8e-aee3-d01accf2d47b -RoleMemberEmailAddress <RoleMemberEmailAddress>
```

Send guest invitation
```
New-AzureADMSInvitation -InvitedUserDisplayName ",DisplayName" -InvitedUserEmailAddress <email> -InviteRedirectURL https://myapps.microsoft.com -SendInvitationMessage $true
```

Verify the user exists in the directory
```
Get-AzureADUser -Filter "UserType eq 'Guest'"
```

Clean up users
```
Remove-AzureADUser -ObjectId "<UPN>"
```

Use the following script to assign a user and role to an application:<BR>
To assign a group to an enterprise app, you must replace Get-AzureADUser with Get-AzureADGroup and replace New-AzureADUserAppRoleAssignment with New-AzureADGroupAppRoleAssignment.
```
# Assign the values to the variables
$username = "<You user's UPN>"
$app_name = "<Your App's display name>"
$app_role_name = "<App role display name>"

# Get the user to assign, and the service principal for the app to assign to
$user = Get-AzureADUser -ObjectId "$username"
$sp = Get-AzureADServicePrincipal -Filter "displayName eq '$app_name'"
$appRole = $sp.AppRoles | Where-Object { $_.DisplayName -eq $app_role_name }

# Assign the user to the app role
New-AzureADUserAppRoleAssignment -ObjectId $user.ObjectId -PrincipalId $user.ObjectId -ResourceId $sp.ObjectId -Id $appRole.Id
```

Run the following commands to get the user ($user) and the service principal ($sp) using the user UPN and the service principal display names.
```
# Get the user to assign, and the service principal for the app to assign to
$user = Get-AzureADUser -ObjectId "$username"
$sp = Get-AzureADServicePrincipal -Filter "displayName eq '$app_name'"
```

Run the command sp.AppRoles to display the roles available for the application.<BR>
```
"$app_role_name = "Analyst (Limited access)"
$appRole = $sp.AppRoles | Where-Object { $_.DisplayName -eq $app_role_name }"
```

To create a self-signed certificate, open PowerShell and run New-SelfSignedCertificate with the following parameters to create the cert in the user certificate store on your computer:
```
$cert=New-SelfSignedCertificate -Subject "CN=DaemonConsoleCert" -CertStoreLocation "Cert:\CurrentUser\My"  -KeyExportPolicy Exportable -KeySpec Signature
```

Export this certificate to a file using the Manage User Certificate MMC snap-in accessible from the Windows Control Panel.

Get 'er installed for PS PIM
```
Find-Module -Name Microsoft.Azure.ActiveDirectory.PIM.PSModule | Install-Module -Verbose -Force -AllowClobber
```

Enumerate commands
```
Get-Command -Module Microsoft.Azure.ActiveDirectory.PIM.PSModule
```

Update help (not that it will help)
```
Get-Help -Name Enable-PrivilegedRoleAssignment
```

Authenticate first
```
Connect-PimService -UserName ''
```

Enumerate eligible roles
```
Get-PrivilegedRoleAssignment
```

Activate a role
```
$params = @{ 'RoleID' = '62e90394-69f5-4237-9190-012177145e10';
             'Reason' = 'Testing PowerShell';
             'Duration' = '0.5'
           }
Enable-PrivilegedRoleAssignment @params
```

Remove elevation
```
Disable-PrivilegedRoleAssignment -RoleId '62e90394-69f5-4237-9190-012177145e10'
```

Play with roles ("Where is ____ role?!")
```
Get-AzureADDirectoryRole | Select-Object -Property DisplayName, Description | Sort-Object -Property DisplayName
```

```
Get-AzureADDirectoryRoleTemplate | Select-Object -Property DisplayName, Description | Sort-Object -Property DisplayName
```

```
$RoleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object { $_.DisplayName -eq "Power BI Service Administrator" }
Enable-AzureADDirectoryRole -RoleTemplateId $RoleTemplate.ObjectId
```

Fetch user to assign to role
```
$roleMember = Get-AzureADUser -ObjectId "<user>"
```

Fetch User Account Administrator role instance
```
$role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq 'Power BI Service Administrator' }
```

If role instance does not exist, instantiate it based on the role template
```
if ($role -eq $null) {
    # Instantiate an instance of the role template
    $roleTemplate = Get-AzureADDirectoryRoleTemplate | Where-Object { $_.displayName -eq 'User Account Administrator' }
    Enable-AzureADDirectoryRole -RoleTemplateId $roleTemplate.ObjectId

    # Fetch User Account Administrator role instance again
    $role = Get-AzureADDirectoryRole | Where-Object { $_.displayName -eq 'User Account Administrator' }
}
```

Add user to role
```
Add-AzureADDirectoryRoleMember -ObjectId $role.ObjectId -RefObjectId $roleMember.ObjectId
```

Fetch role membership for role to confirm
```
Get-AzureADDirectoryRoleMember -ObjectId $role.ObjectId | Get-AzureADUser
```