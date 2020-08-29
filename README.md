# Azure CLI Cheatsheet
Security Engineer Prep for Azure 
## Configuring Azure Active Directory for Microsoft Azure Workloads

### Quickstart: Add guest users in the Azure portal - Azure Active Directory | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/b2b/b2b-quickstart-add-guest-users-portal

### Azure Active Directory Documentation - Tutorials, API Reference | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/#pivot=products&panel=indexA

### Azure Active Directory users, groups, roles, and licenses documentation | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/

### Add or delete users - Azure Active Directory | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory

### Creating a new user in Azure AD | Microsoft Docs
https://docs.microsoft.com/en-us/powershell/azure/active-directory/new-user-sample?view=azureadps-2.0

### New-AzureADUser (AzureAD) Syntax Options | Microsoft Docs
https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureaduser?view=azureadps-2.0

### AzureAD | Microsoft Docs
https://docs.microsoft.com/en-us/powershell/module/azuread/?view=azureadps-2.0

### New-AzureADGroup (AzureAD) Syntax Options | Microsoft Docs
https://docs.microsoft.com/en-us/powershell/module/azuread/new-azureadgroup?view=azureadps-2.0

### What is Azure Active Directory B2B collaboration? - Azure Active Directory | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/b2b/what-is-b2b


### Powershell Commands
Getting AzureAD powershell module
```
Install-Module -Name Azure500AD -Repository PSGallery -Verbose
```

Authenticate to Azure AD
```
Connect-AzureAD
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
