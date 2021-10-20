locals {
  vnet_cidr = "10.10.0.0/16"
  subnets = [
    {
      name              = "${var.stack}-${var.client_name}-${module.azure_region.location_short}-${var.environment}-subnet1"
      cidr              = ["10.10.0.0/24"]
      service_endpoints = ["Microsoft.ContainerRegistry"]
      nsg_name          = local.security_group_names[0]
    },
    {
      name              = "${var.stack}-${var.client_name}-${module.azure_region.location_short}-${var.environment}-subnetTWO"
      cidr              = ["10.10.1.0/24"]
      service_endpoints = ["Microsoft.ContainerRegistry"]
      nsg_name          = local.security_group_names[1]
    },
  ]

  security_group_names = [
    "my-${var.stack}-subnet-nsg-01",
    "my-${var.stack}-subnet-nsg-02",
  ]
}
