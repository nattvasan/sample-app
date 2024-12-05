module "subnet_addrs" {
  source = "hashicorp/subnets/cidr"

  base_cidr_block = var.cidr_range
  networks        = var.subnet_networks == null ? local.subnet_structures : var.subnet_networks
}

resource "azurerm_subnet" "k8s_subnet" {
  address_prefixes     = [module.subnet_addrs.network_cidr_blocks["${var.cluster_name}-sn"]]
  name                 = "${var.cluster_name}-sn"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  service_endpoints = [
    "Microsoft.AzureCosmosDB",
    "Microsoft.KeyVault",
    "Microsoft.Storage",
    "Microsoft.Sql",
  ]
}

resource "azurerm_subnet" "k8s_subnet_appgw" {
  address_prefixes     = [module.subnet_addrs.network_cidr_blocks["${var.cluster_name}gw"]]
  name                 = "${var.cluster_name}gw"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet.name
}