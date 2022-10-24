locals {
  vnet_cidr = "10.10.0.0/16"
  subnets = [
    {
      name              = "${var.stack}-${var.client_name}-${module.azure_region.location_short}-${var.environment}-subnet1"
      cidr              = ["10.10.0.0/24"]
      service_endpoints = ["Microsoft.ContainerRegistry"]
      nsg_name          = "my-${var.stack}-subnet-nsg-01"
    },
    {
      name              = "${var.stack}-${var.client_name}-${module.azure_region.location_short}-${var.environment}-subnetTWO"
      cidr              = ["10.10.1.0/24"]
      service_endpoints = ["Microsoft.ContainerRegistry"]
      nsg_name          = "my-${var.stack}-subnet-nsg-02"
    },
  ]
}
