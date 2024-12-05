module "network" {
  source               = "../../sub-modules/azure-resources/network-infrastructure"
  is_hub               = true
  location             = var.location
  resource_group_name  = azurerm_resource_group.network_rg.name
  virtual_network_name = "testapp-network"
  address_space = ["10.32.0.0/16"]
  tags = var.tags

  cidr_range      = "10.80.0.0/16"
  cluster_name    = "testapp-cluster"
  subnet_networks = var.subnet_networks
}
