# Create a service principal for automated Azure PowerShell login

$cert = New-SelfSignedCertificate -CertStoreLocation "cert:\CurrentUser\My" `
    -Subject "CN=psautoauth" `
    -KeySpec KeyExchange

$keyValue = [System.Convert]::ToBase64String($cert.GetRawCertData())

$sp = New-AzADServicePrincipal -DisplayName 'psautoauth' `
    -CertValue $keyValue `
    -EndDate $cert.NotAfter `
    -StartDate $cert.NotBefore
Start-Sleep -Seconds 20

New-AzRoleAssignment -RoleDefinitionName Contributor -ServicePrincipalName $sp.ApplicationId # -Scope defaults to subscription level

$TenantId = (Get-AzSubscription -SubscriptionName "Microsoft Azure Sponsorship").TenantId

$ApplicationId = (Get-AzADApplication -DisplayNameStartWith 'psautoauth').ApplicationId

$Thumbprint = (Get-ChildItem cert:\CurrentUser\My\ | Where-Object { $_.Subject -eq "CN=psautoauth" }).Thumbprint

Connect-AzAccount -ServicePrincipal `
    -CertificateThumbprint $Thumbprint `
    -ApplicationId $ApplicationId `
    -TenantId $TenantId