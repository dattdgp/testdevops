$resourceGroup = Read-Host -Prompt "Enter your resource group name"
echo "creating the resourge group $resourceGroup..."
az group create --name $resourceGroup --location eastus
echo "Resource group $resourceGroup is created."
echo "Adding IOT Hub extension..."
az extension add --name azure-iot
$iothub = Read-Host -Prompt "Enter your unique IOT Hub name: "
echo "Creating Azure IOT Hub --> $iothub with S1 SKU"
az iot hub create --name $iothub --resource-group $resourceGroup --sku S1
$deviceID = Read-Host -Prompt "Enter the device ID to be added to $iothub hub: "
echo "Adding IoT device $deviceID to the IoT hub $iothub with authentication type as x509 CA signed..."
az iot hub device-identity create -n $iothub -d $deviceID --am x509_ca --status enabled --status-reason 'for testing'
