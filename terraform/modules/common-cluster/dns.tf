module "dns" {
  source              = "../../sub-modules/azure-resources/dns"
  location            = var.location
  resource_group_name = azurerm_resource_group.network_rg.name
  hub_vnet_id         = module.network.virtual_network.id
  tags                = var.tags
}
