# Front-end certificate
Get-ChildItem -Path $(New-SelfSignedCertificate -dnsname frontend.frontend).pspath | Export-PfxCertificate -FilePath "C:\frontend.pfx" -Password $(ConvertTo-SecureString -String "" -Force -AsPlainText)

# Back-end certificate
$cert = Get-ChildItem -Path $(New-SelfSignedCertificate -dnsname backend.backend).pspath
Export-PfxCertificate -Cert $cert -FilePath "C:\backend.pfx" -Password $(ConvertTo-SecureString -String "" -Force -AsPlainText)

# Back-end public key
Export-Certificate -Cert $cert -FilePath "C:\backend-public.cer"

# Encode the certs
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\frontend.pfx")) > "C:\frontend.txt"
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\backend.pfx")) > "C:\backend.txt"
[System.Convert]::ToBase64String([System.IO.File]::ReadAllBytes("C:\backend-public.cer")) > "C:\backend-public.txt"



