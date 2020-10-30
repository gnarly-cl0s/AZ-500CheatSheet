# Target SKU: '2016-Datacenter'

$locName = 'SouthCentralUS'

Get-AzureRmVMImagePublisher -Location $locName | where-object {$_.PublisherName -like "*windows*"} | Format-Table -Property PublisherName, Location

$pubName = "MicrosoftWindowsServer"

Get-AzureRmVMImageOffer -Location $locName -PublisherName $pubName | Format-Table -Property Offer, PublisherName, Location

$offerName = "WindowsServer"

Get-AzureRmVMImageSku -Location $locName -PublisherName $pubName -Offer $offerName | Format-Table -Property Skus, Offer, PublisherName, Location

$skuName = "2016-Datacenter"

Get-AzureRmVMImage -Location $locName -PublisherName $pubName -Skus $skuName -Offer $offerName