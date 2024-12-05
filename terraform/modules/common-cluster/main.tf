data "azurerm_client_config" "current" {}

data "azurerm_subscription" "primary" {}

resource "azurerm_resource_group" "rg" {
  count    = var.create_resource_group ? 1 : 0
  name     = var.resource_group_name
  location = var.location
}


module "serviceprincipal" {
  source                    = "../../sub-modules/azure-resources/serviceprincipal"
  service_principal_name    = var.service_principal_name
  password_rotation_in_days = var.password_rotation_in_days

  depends_on = [azurerm_resource_group.rg]
}

# module "keyvault" {
#   source                          = "../../sub-modules/azure-resources/keyvault"
#   key_vault_name                  = var.key_vault_name
#   location                        = var.location
#   resource_group_name             = var.resource_group_name
#   service_principal_name          = var.service_principal_name
#   service_principal_object_id     = module.serviceprincipal.service_principal_object_id
#   service_principal_tenant_id     = module.serviceprincipal.service_principal_tenant_id
#   service_principal_client_id     = module.serviceprincipal.client_id
#   service_principal_client_secret = module.serviceprincipal.client_secret
#   vault_private_endpoint_name     = var.vault_private_endpoint_name
#   tags                            = var.tags
#   kubernetes_resources_subnet_id  = var.kubernetes_resources_subnet_id
#   keyvault_name                   = var.key_vault_name
#   password_rotation_in_days       = var.password_rotation_in_days

#   depends_on = [
#     module.serviceprincipal
#   ]
# }