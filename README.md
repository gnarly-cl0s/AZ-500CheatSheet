# Azure CLI Cheatsheet
Security Engineer Prep for Azure 
## Configuring Azure Active Directory for Microsoft Azure Workloads

### Azure Active Directory Documentation - Tutorials, API Reference | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/#pivot=products&panel=indexA

### Azure Active Directory users, groups, roles, and licenses documentation | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/

### Add or delete users - Azure Active Directory | Microsoft Docs
https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory

### Creating a new user in Azure AD | Microsoft Docs
https://docs.microsoft.com/en-us/powershell/azure/active-directory/new-user-sample?view=azureadps-2.0

'''
powershell New-AzureADUser -AccountEnabled $True -DisplayName "Abby Brown" -PasswordProfile $PasswordProfile -MailNickName "AbbyB" -UserPrincipalName "AbbyB@contoso.com"
'''