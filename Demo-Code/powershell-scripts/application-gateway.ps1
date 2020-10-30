<# Ref:
    https://github.com/Azure/azure-quickstart-templates/tree/master/201-application-gateway-2vms-iis-ssl
#>

# Front-end cert
Get-ChildItem -Path $(New-SelfSignedCertificate -dnsname company.local).pspath | Export-PfxCertificate -FilePath "C:\scripts\frontend.pfx" -Password $(ConvertTo-SecureString -String "" -Force -AsPlainText)

# Back-end cert
$cert = Get-ChildItem -Path $(New-SelfSignedCertificate -dnsname company.local).pspath
Export-PfxCertificate -Cert $cert -FilePath "C:\scripts\backend.pfx" -Password $(ConvertTo-SecureString -String "" -Force -AsPlainText)

# Back-end public key
Export-Certificate -Cert $cert -FilePath "C:\scripts\backend-public.cer"

# Encode the certs
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\scripts\frontend.pfx")) > "C:\scripts\frontend.txt"
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\scripts\backend.pfx")) > "C:\scripts\backend.txt"
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\scripts\backend-public.cer")) > "C:\scripts\backend-public.txt"

# Load up the files
code .\frontend.txt
code .\backend.txt
code .\backend-public.txt

