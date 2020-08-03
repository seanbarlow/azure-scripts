# Change the execution policy so unsigned scripts can be run.
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass

# Log in to Azure Subscription
Login-AzAccount

# Resource Group Name Propt
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name"

# Location Prompt
$location = Read-Host -Prompt "Enter the location (i.e. southcentralus)"

# Create a new resource group setting the name and location
$resourceGroup = New-AzResourceGroup -Name $resourceGroupName -Location $location

# IoT Hub Name Prompt
$iotHubName = Read-Host -Prompt "Enter the IoT Hub name"

# Create the IoT Hub
$iotHub = New-AzIotHub -ResourceGroupName $resourceGroup.ResourceGroupName -Name $iotHubName -SkuName S1 -Units 1 -Location $location

# Print the details of the IoT Hub to the console
Write-Output $iotHub