output "virtual_network_id" {
  description = "id of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}

output "virtual_network_name" {
  description = "name of the virtual network"
  value       = azurerm_virtual_network.vnet.name
}

output "virtual_network" {
  description = "Object of the virtual network"
  value       = azurerm_virtual_network.vnet
}

output "subnets" {
  description = "subnet/subnets output for the vnet created"
  value       = azurerm_subnet.subnets
}

output "virtual_network_address_space" {
  value = azurerm_virtual_network.vnet.address_space
}

output "subnet_list" {
  value = module.subnet_addrs.network_cidr_blocks
}

output "subnet_resources" {
  value = {
    kube    = azurerm_subnet.k8s_subnet,
    appgw   = azurerm_subnet.k8s_subnet_appgw
  }
}
