# Import the Az.Blueprint module if it is not installed
Import-Module -Name Az.Blueprint

# Log into Azure
Connect-AzAccount

# Select the appropriate subscription
# Change SUB_NAME to your subscription name
Get-AzSubscription -SubscriptionName "SUB_NAME" | Select-AzSubscription

# Create the Blueprint item
$blueprint = New-AzBlueprint -Name "Production-Subscriptions" -BlueprintFile "Blueprint.json"

# Add the Blueprint artifacts
New-AzBlueprintArtifact -Blueprint $blueprint -Name 'policyTags' -ArtifactFile ".\Artifacts\policyTags.json"
New-AzBlueprintArtifact -Blueprint $blueprint -Name 'roleAssignment' -ArtifactFile ".\Artifacts\roleAssignment.json"
New-AzBlueprintArtifact -Blueprint $blueprint -Type TemplateArtifact -Name 'vnetTemplate' -TemplateFile ".\Artifacts\vnetTemplate.json" -TemplateParameterFile ".\Artifacts\vnetTemplateParams.json" -ResourceGroupName "Networking"

# Publish the Blueprint
Publish-AzBlueprint -Blueprint $blueprint -Version '1.0'

# Edit the BlueprintAssignment.json file with the proper BLUEPRINT_ID and PRINCIPAL_ID
Write-Output $blueprint.Id

# Assign the Blueprint to the proper subscription or management group
New-AzBlueprintAssignment -Name "Contoso-Prod" -Blueprint $blueprint -AssignmentFile ".\BlueprintAssignment.json"