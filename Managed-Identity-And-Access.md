# Azure Security Engineer Study Guide Prep For AZ-500 (30-35% Questions Pertain to this Domain)

![Managed Identity](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/media/how-managed-identities-work-vm/data-flow.png)
[Azure Policy Github Samples](https://github.com/azure/azure-policy)

[GitHub - Azure-Samples/app-service-api-dotnet-todo-list: A simple Todo list application built using Web API and Azure API Apps](https://github.com/Azure-Samples/app-service-api-dotnet-todo-list)
Follow <https://docs.microsoft.com/en-us/azure/app-service/app-service-web-tutorial-rest-api>

[Azure identity & access security best practices | Microsoft Docs](https://docs.microsoft.com/en-us/azure/security/azure-security-identity-management-best-practices)

[Azure REST API Reference | Microsoft Docs](https://docs.microsoft.com/en-us/rest/api/azure/)

[REST API Browser | Microsoft Docs](https://docs.microsoft.com/en-us/rest/api/)

[Microsoft Graph or the Azure AD Graph - Microsoft 365 Developer Blog](https://developer.microsoft.com/en-us/office/blogs/microsoft-graph-or-azure-ad-graph/)

## 1. Manage Azure Active Directory identities

Azure Active Directory Documentation - Tutorials, API Reference | Microsoft Docs

- [] <https://docs.microsoft.com/en-us/azure/active-directory/>
- [] <https://docs.microsoft.com/en-us/azure/role-based-access-control/rbac-and-directory-admin-roles>

### 1.1 Configure security for service principals

- [] [What are managed identities for Azure resources?](https://docs.microsoft.com/en-us/azure/active-directory/managed-identities-azure-resources/overview)
- [] [How to: Use Azure PowerShell to create a service principal with a certificate](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-authenticate-service-principal-powershell)
- [] [Application and service principal objects in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/develop/app-objects-and-service-principals)

### 1.2 Manage Azure AD directory groups

- [] [Create a basic group and add members using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-create-azure-portal)
- [] [Azure Active Directory version 2 cmdlets for group management](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/groups-settings-v2-cmdlets)
- [] [Manage app and resource access using Azure Active Directory groups](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-manage-groups)
- [] [Add or remove group members using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-groups-members-azure-portal)
- [] [Create or update a dynamic group in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/groups-create-rule)
- [] [New-AzureADGroup (AzureAD) Syntax Options | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureadgroup?view=azureadps-2.0)
- [] [New-AzureADGroupAppRoleAssignment](https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureadgroupapproleassignment?view=azureadps-2.0)

### 1.3 Manage Azure AD users

- [] [Assign or remove licenses in the Azure Active Directory portal](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/license-users-groups)
- [] [Add or change Azure subscription administrators](https://docs.microsoft.com/en-us/azure/billing/billing-add-change-azure-subscription-administrator)
- [] [Add or delete users - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory)
- [] [Creating a new user in Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/azure/active-directory/new-user-sample?view=azureadps-2.0)
- [] [New-AzureADUser (AzureAD) Syntax Options | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?view=azureadps-2.0)
- [] [Quickstart: Add guest users in the Azure portal](https://docs.microsoft.com/en-us/azure/active-directory/b2b/b2b-quickstart-add-guest-users-portal)
- [] [Quickstart: Add a guest user with PowerShell](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/b2b-quickstart-invite-powershell)
- [] [What is Azure Active Directory B2B collaboration? - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/b2b/what-is-b2b)
- [] [Add Azure Active Directory B2B collaboration users (Guest) in the Azure portal](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/add-users-administrator)
- [] [Enable B2B external collaboration and manage who can invite guests](https://docs.microsoft.com/en-us/azure/active-directory/external-identities/delegate-invitations)
- [] [AzureAD | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0)
- [] [New-AzureADUserAppRoleAssignment](https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduserapproleassignment?view=azureadps-2.0)

### 1.4 Configure password writeback

### 1.5 Configure authentication methods including password hash and Pass Through Authentication (PTA), OAuth, and passwordless

- [] [What authentication and verification methods are available in Azure Active Directory?](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-authentication-methods)
- [] [Choose the right authentication method for your Azure Active Directory hybrid identity solution](https://docs.microsoft.com/en-us/azure/security/fundamentals/choose-ad-authn)
- [] [What is password hash synchronization with Azure AD?](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/whatis-phs)
- [] [Deploying Active Directory Federation Services in Azure](https://docs.microsoft.com/en-us/windows-server/identity/ad-fs/deployment/how-to-connect-fed-azure-adfs)
- [] [Azure AD Connect and federation | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-fed-whatis)
- [] [Azure AD Connect: Pass-through Authentication | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-pta)
- [] [Azure AD Connect: Seamless Single Sign-On | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sso)

### 1.6 Transfer Azure subscriptions between Azure AD tenants

- [] [Associate or add an Azure subscription to your Azure Active Directory tenant](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-subscriptions-associated-directory)
- [] [Transfer billing ownership of an Azure subscription to another account](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/billing-subscription-transfer)
- [] [Transfer Azure subscriptions between subscribers and CSPs](https://docs.microsoft.com/en-us/azure/cost-management-billing/manage/transfer-subscriptions-subscribers-csp)
- [] [Characteristics of multiple tenant interaction - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/licensing-directory-independence)
- [] [Moving an Azure Key Vault to another subscription | Microsoft Docs](https://docs.microsoft.com/en-us/azure/key-vault/key-vault-subscription-move-fix)

## 2. Configure secure access by using Azure AD

- [] [Microsoft identity platform (v2.0) overview - Azure | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-overview)
![Microsoft Identity Platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/media/v2-overview/application-scenarios-identity-platform.png)

- [] [Why update to Microsoft identity platform (v2.0) | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/develop/azure-ad-endpoint-comparison)

### 2.1 Monitor privileged access for Azure AD Privileged Identity Management (PIM)

- [] [What is Azure AD Privileged Identity Management?](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-configure)
- [] [Assign Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-add-role-to-user)
- [] [Assign Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-deployment-plan)
- [] [View activity and audit history for Azure resource roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/azure-pim-resource-rbac)
- [] [Email notifications in PIM](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-email-notifications)
- [] [View audit history for Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-use-audit-log)
- [] [Configure security alerts for Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-configure-security-alerts)

### 2.2 Configure Access Reviews

- [] [Use a resource dashboard to perform an access review in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-overview-dashboards)
- [] [Review access to Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-perform-security-review)
- [] [Create an access review of Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-start-security-review)
- [] [Create an access review of groups and applications in Azure AD access reviews](https://docs.microsoft.com/en-us/azure/active-directory/governance/create-access-review)
- [] [Create an access review of Azure resource roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-start-access-review)

### 2.3 Activate and configure PIM

- [] [Privileged Identity Management documentation](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/)
- [] [Activate my Azure AD roles in PIM](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-activate-role)
- [] [Start using Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-getting-started#enable-pim)
- [] [Approve or deny requests for Azure AD roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/azure-ad-pim-approval-workflow)
- [] [Approve or deny requests for Azure resource roles in Privileged Identity Management](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-resource-roles-approval-workflow)
- [] [What are access reviews? - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/bs-latn-ba/azure/active-directory/governance/access-reviews-overview)
- [] [License requirements to use PIM - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/subscription-requirements)
- [] [Getting started with Azure AD PIM PowerShell Module | GoToGuy Blog](https://gotoguy.blog/2018/05/22/getting-started-with-azure-ad-pim-powershell-module/)
- [] [Configure Azure AD role settings in Privileged Identity Management](https://docs.microsoft.com/bs-latn-ba/azure/active-directory/privileged-identity-management/pim-how-to-change-default-settings?view=powerbiaspnetwf-1.1.10)

### 2.4 Implement Conditional Access policies including Multi-Factor Authentication (MFA)

- [] [Tutorial: Secure user sign-in events with Azure Multi-Factor Authentication](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/app-based-mfa)
- [] [Configure Azure Multi-Factor Authentication settings](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-mfasettings)
- [] [Manage user authentication methods for Azure Multi-Factor Authentication](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-userdevicesettings)
- [] [Change your two-factor verification method and settings](https://docs.microsoft.com/en-us/azure/active-directory/user-help/multi-factor-authentication-end-user-manage-settings)
- [] [What is Conditional Access?](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/overview)
- [] [Plan a Conditional Access deployment](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/plan-conditional-access)
- [] [Building a Conditional Access policy](https://docs.microsoft.com/en-us/azure/active-directory/conditional-access/concept-conditional-access-policies)
- [] [Manage access to Azure management with Conditional Access](https://docs.microsoft.com/en-us/azure/role-based-access-control/conditional-access-azure-management)
- [] [What is Azure role-based access control (Azure RBAC)?](https://docs.microsoft.com/en-us/azure/role-based-access-control/overview)
- [] [Multi-factor authentication (MFA) and PIM - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-require-mfa)
- [] [Grant access to other administrators to manage PIM - Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/privileged-identity-management/pim-how-to-give-access-to-pim)

### 2.5 Configure Azure AD identity protection

- [] [What is Identity Protection?](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/overview-identity-protection)
- [] [How To: Configure the Azure Multi-Factor Authentication registration policy](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-mfa-policy)
- [] [How To: Configure and enable risk policies](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/howto-identity-protection-configure-risk-policies)
- [] [How it works: Azure Multi-Factor Authentication](https://docs.microsoft.com/en-us/azure/active-directory/authentication/concept-mfa-howitworks)
- [] [Plan an Azure Multi-Factor Authentication deployment](https://docs.microsoft.com/en-us/azure/active-directory/authentication/howto-mfa-getstarted)
- [] [Identity Protection policies](https://docs.microsoft.com/en-us/azure/active-directory/identity-protection/concept-identity-protection-policies)
- [] [What is Azure AD Identity Governance?](https://docs.microsoft.com/en-us/azure/active-directory/governance/identity-governance-overview)

## 3. Manage application access

- [] [How and why applications are added to Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/develop/active-directory-how-applications-are-added)

### 3.1 Create App Registration

- [] [How to: Use the portal to create an Azure AD application and service principal that can access resources](https://docs.microsoft.com/en-us/azure/active-directory/develop/howto-create-service-principal-portal)
- [] [Quickstart: Register an application with the Microsoft identity platform](https://docs.microsoft.com/en-us/azure/active-directory/develop/quickstart-register-app)
- [] [Register an application with the Microsoft identity platform](https://docs.microsoft.com/en-us/graph/auth-register-app-v2)
- [] [Tutorial: Register a web application in Azure Active Directory B2C](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-register-applications)
- [] [Tutorial: Register an app with Azure Active Directory](https://docs.microsoft.com/en-us/powerapps/developer/common-data-service/walkthrough-register-app-azure-active-directory)
- [] [Register your application to use Azure Active Directory | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/manage-apps/developer-guidance-for-integrating-applications)

### 3.2 Configure App Registration permission scopes

- [] [Permissions and consent in the Microsoft identity platform endpoint](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-permissions-and-consent)
- [] [Use an app identity to access Azure Stack Hub resources](https://docs.microsoft.com/en-us/azure-stack/operator/azure-stack-create-service-principals)

### 3.3 Manage App Registration permission consent

- [] [Manage app registration and API permission for Microsoft Graph notifications](https://docs.microsoft.com/en-us/graph/notifications-integration-app-registration)

### 3.4 Manage API access to Azure subscriptions and resources

- [] [Authentication flows and application scenarios](https://docs.microsoft.com/en-us/azure/active-directory/develop/authentication-flows-app-scenarios)
- [] [Add or remove Azure role assignments using the REST API](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-rest)
- [] [Add or remove Azure role assignments using the Azure portal](https://docs.microsoft.com/en-us/azure/role-based-access-control/role-assignments-portal)

## 4. Manage access control

### 4.1 Configure subscription and resource permissions

- [] [Azure built-in roles](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles)
- [] [Administrator role permissions in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/directory-assign-admin-roles)
- [] [Application roles | Microsoft Docs](https://docs.microsoft.com/en-us/azure/architecture/multitenant-identity/app-roles)
- [] [Azure Management - Governance | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/)
- [] [Understand deny assignments for Azure resources | Microsoft Docs](https://docs.microsoft.com/en-us/azure/role-based-access-control/deny-assignments)
- [] [Organize your resources with Azure management groups - Azure Governance | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/management-groups/)
- [] [Subscriptions, licenses, accounts, and tenants for Microsoft's cloud offerings | Microsoft Docs](https://docs.microsoft.com/en-us/office365/enterprise/subscriptions-licenses-accounts-and-tenants-for-microsoft-cloud-offerings)

### 4.2 Configure resource group permissions

- [] [Elevate access to manage all Azure subscriptions and management groups | Microsoft Docs](https://docs.microsoft.com/en-us/azure/role-based-access-control/elevate-access-global-admin)

### 4.3 Configure custom RBAC roles

- [] [Custom roles for Azure resources | Microsoft Docs](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles)
- [] [Tutorial: Create an Azure custom role using Azure PowerShell](https://docs.microsoft.com/en-us/azure/role-based-access-control/tutorial-custom-role-powershell)

### 4.4 Identify the appropriate role

### 4.5 Apply principle of least privilege

### 4.6 Interpret permissions

### 4.7 Check access

- [] [What are security defaults?](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/concept-fundamentals-security-defaults)

# EXTRA

[Adal to Msal · AzureAD/microsoft-authentication-library-for-dotnet Wiki · GitHub](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/wiki/Adal-to-Msal)

## Install and configure Azure AD Connect

[Download Azure AD Connect](https://www.microsoft.com/en-us/download/details.aspx?id=47594)

[MSOnline | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/msonline/?view=azureadps-1.0)

- [] [Azure AD Connect: Supported topologies | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-topologies)
- [] [Azure AD Connect sync: Operational tasks and considerations | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-staging-server)
- [] [Azure AD UserPrincipalName population | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-userprincipalname)
- [] [Azure AD Connect: Prerequisites and hardware | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-prerequisites)
- [] [What is Azure AD Connect?](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/whatis-azure-ad-connect)
- [] [Select which installation type to use for Azure AD Connect](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-select-installation)
- [] [Getting started with Azure AD Connect using express settings](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-express)
- [] [Custom installation of Azure Active Directory Connect](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-install-custom)
- [] [Connect Your App to Microsoft Azure Active Directory](https://auth0.com/docs/connections/enterprise/azure-active-directory/v2)
- [] [Azure AD Connect: Accounts and permissions](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/reference-connect-accounts-permissions)
- [] [Prepare a non-routable domain for directory synchronization | Microsoft Docs](https://docs.microsoft.com/en-us/office365/enterprise/prepare-a-non-routable-domain-for-directory-synchronization)
- [] [IP Address Management (IPAM) | Microsoft Docs](https://docs.microsoft.com/en-us/windows-server/networking/technologies/ipam/ipam-top)
- [] [Privileged Access Management for Active Directory Domain Services | Microsoft Docs](https://docs.microsoft.com/en-us/microsoft-identity-manager/pam/privileged-identity-management-for-active-directory-domain-services)
- [] [Privileged access management in Office 365 | Microsoft Docs](https://docs.microsoft.com/en-us/office365/securitycompliance/privileged-access-management-overview)
- [] [What is hybrid identity with Azure Active Directory? | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/whatis-hybrid-identity)
- [] [Factors influencing the performance of Azure AD Connect | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/plan-connect-performance-factors)
- [] [Azure AD Connect sync: Scheduler | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-feature-scheduler)
- [] [The Azure AD Connect Sync Service Manager Metaverse Search | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-service-manager-ui-mvsearch)
- [] [Azure AD Connect sync: Make a configuration change in Azure AD Connect sync | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-sync-change-the-configuration)
- [] [Azure AD Connect and federation | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/hybrid/how-to-connect-fed-whatis)
- [] [How to Disable Office365 Federation](https://support.okta.com/help/s/article/Disable-Office365-Federation-from-Active-Directory-Domain)
- [] [Understand the OAuth 2.0 authorization code flow in Azure AD | Microsoft Docs](https://docs.microsoft.com/en-us/azure/active-directory/develop/v1-protocols-oauth-code)

## Governance

- [] [Overview of Azure Blueprints - Azure Blueprints | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/blueprints/overview)
- [] [Overview of Azure Resource Graph - Azure Resource Graph | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/resource-graph/overview)
- [] [Overview of Azure Cost Management | Microsoft Docs](https://docs.microsoft.com/en-us/azure/cost-management/overview-cost-mgt)
- [] [Overview of Azure Policy - Azure Policy | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/policy/overview)
- [] [Create a custom policy definition - Azure Policy | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/policy/tutorials/create-custom-policy-definition)
- [] [Details of the policy definition structure - Azure Policy | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/policy/concepts/definition-structure)
- [] [Get policy compliance data - Azure Policy | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/get-compliance-data)
- [] [Remediate non-compliant resources - Azure Policy | Microsoft Docs](https://docs.microsoft.com/en-us/azure/governance/policy/how-to/remediate-resources)

# Powershell Commands

See Demo-Code folder for examples of various uses in powershell or demo apps

[What is PowerShell?](https://docs.microsoft.com/en-us/powershell/scripting/overview?view=powershell-7)

[Create a Custom Role-PowerShell](https://docs.microsoft.com/en-us/azure/role-based-access-control/custom-roles-powershell)

[about_Splatting | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_splatting?view=powershell-7.1)

- [] [Use Azure service principals with Azure PowerShell | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/azure/create-azure-service-principal-azureps?view=azps-5.0.0)
- [] [Overview of Azure PowerShell | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/azure/?view=azps-5.0.0)
- [] [Get-AzProviderOperation (Az.Resources) | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azprovideroperation?view=azps-5.0.0)
- [] [Get-AzRoleDefinition (Az.Resources) | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/az.resources/get-azroledefinition?view=azps-5.0.0)
- [] [New-AzRoleDefinition (Az.Resources) | Microsoft Docs](https://docs.microsoft.com/en-us/powershell/module/az.resources/new-azroledefinition?view=azps-5.0.0)
- [] [Troubleshoot RBAC for Azure resources | Microsoft Docs](https://docs.microsoft.com/en-us/azure/role-based-access-control/troubleshooting)

## Getting AzureAD powershell module

```
install-module azuread
Install-Module -Name AzureAD -Repository PSGallery -Verbose
import-module azuread
Get-Module -ListAvailable AzureAD*
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

Operations for Microsoft Support as a example in order to create custom role
```
Get-AzProviderOperation 'Microsoft.Support/*' | Format-Table -Property Operation, Description -AutoSize
```

Extract similar role for editing
```
Get-AzRoleDefinition -Name 'Reader' | ConvertTo-Json | Out-File 'D:\ReaderSupportRole.json'
```

Get subscription ID and include as scope to extracted json file above
```
Get-AzSubscription | Select-Object -Property id
```

Create
```
New-AzRoleDefinition -InputFile 'D:\ReaderSupportRole.json'
```

Check new role creation
```
Get-AzRoleDefinition | Where-Object -FilterScript { $_.IsCustom -eq $true } | Format-Table -Property Name, IsCustom

Get-AzRoleDefinition 'Help Desk Support' | Remove-AzRoleDefinition -Force

Get-AzRoleDefinition | ? { $_.IsCustom -eq $true } | Remove-AzRoleDefinition -Force

Remove-AzRoleDefinition -Id '22222222-2222-2222-2222-222222222222'
```
