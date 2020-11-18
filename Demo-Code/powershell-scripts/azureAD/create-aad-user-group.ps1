# Authenticate to Azure AD
Connect-AzureAD

#To connect to a specific environment of Azure Active Directory, use the AzureEnvironment parameter, as follows:
Connect-AzureAD -AzureEnvironment "AzureGermanyCloud"

# Create an Azure AD User
<#PasswordProfile - Specifies the user's password profile. Note that the parameter type for this parameter is "PasswordProfile". 
in order to pass a parameter of this type, you first need to create a variable in PowerShell with that type. We can do that with the New-Object cmdlet:#>
$PasswordProfile = New-Object -TypeName Microsoft.Open.AzureAD.Model.PasswordProfile

#Then you can proceed to set the value of the password in this variable:
$PasswordProfile.Password = ""

#To create the user, call the New-AzureADUser cmdlet with the parameter values:
New-AzureADUser -AccountEnabled $True -DisplayName "UserTest 2" `
    -PasswordProfile $PasswordProfile -MailNickName "UserT2" `
    -UserPrincipalName "UserT2@onmicrosoft.com"

# Create an Azure AD group
New-AzureADGroup -DisplayName "Legal2" `
    -MailEnabled $false -SecurityEnabled $true `
    -MailNickName "NotSet"

#To retrieve all groups in the directory
Get-AzureADGroup
Get-AzureADGroup -ObjectId <OBJECT-ID>
Get-AzureADGroup -Filter "DisplayName eq 'string'"

# Add a group member
$group = Get-AzureADGroup -Filter "DisplayName eq 'Legal2'"

Get-AzureADGroupMember -ObjectId $group.ObjectId

Get-AzureADUser | Where-Object -FilterScript { $_.UserType -eq 'Member' } |
Select-Object -Property objectId, DisplayName

Add-AzureADGroupMember -ObjectId $group.ObjectId `
    -RefObjectId "6e213629-6a44-4955-9c9b-5d8b80d51419"
