# todo

resource "azurerm_virtual_network" "vnet" {
  name                = var.virtual_network_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = var.address_space

  tags = var.tags
  lifecycle {
    ignore_changes = [
      resource_group_name
    ]
  }
}

resource "azurerm_subnet" "cluster-subnet" {
  resource_group_name  = azurerm_resource_group.resource-group.name
  virtual_network_name = azurerm_virtual_network.kubernetes-vnet.name
  name                 = "cluster-subnet"
  address_prefixes     = [var.cluster-subnet-address-prefix]
  lifecycle {
    ignore_changes = [
      resource_group_name
    ]
  }
}