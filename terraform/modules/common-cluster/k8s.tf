module "aks" {
  source                         = "../../sub-modules/azure-resources/aks"
  cluster_name                   = var.cluster_name
  client_id                      = module.serviceprincipal.client_id
  client_secret                  = module.serviceprincipal.client_secret
  location                       = var.location
  resource_group_name            = var.resource_group_name
  system_nodepool_name           = var.system_nodepool_name
  system_nodepool_node_tier      = var.system_nodepool_node_tier
  system_nodepool_node_min_count = var.system_nodepool_node_min_count
  system_nodepool_node_max_count = var.system_nodepool_node_max_count
  user_nodepool1_name            = var.user_nodepool1_name
  user_nodepool1_node_tier       = var.user_nodepool1_node_tier
  user_nodepool1_node_max_count  = var.user_nodepool1_node_max_count
  user_nodepool1_node_min_count  = var.user_nodepool1_node_min_count

  admin_username     = var.admin_username
  kubernetes_version = var.kubernetes_version
  tags               = var.tags

  depends_on = [
    module.serviceprincipal,
    module.keyvault
  ]
}
