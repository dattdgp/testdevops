echo "This is displayed"
#echo "This is NOT"
echo "creating the resourge group..."
az group create --name wincc-rg1 --location eastus
az extension add --name azure-iot
az iot hub create --name demoHub-01 --resource-group wincc-rg --sku S1
az iot hub device-identity create -n demoHub-01 -d dgp-wincc --am x509_ca --status enabled --status-reason 'for testing'
