module "vault" {
  source                    = "../../sub-modules/kubernetes-resources/vault"
  resource_group            = azurerm_resource_group.network_rg
  env                       = local.env
  location                  = var.location
  subnet                    = module.network.subnet_resources["kube"].id
  domain                    = module.dns.priv_env_gnd_aerq_internal_dns_zone["global"].name
  cluster_client_identity   = module.k8s_managment_cluster.cluster_client_identity
  tenant_id                 = var.tenant_id
  subscription_id           = var.subscription_id
  vault_ui_redirect_address = "https://vault.testing.com"
  vault_version             = "0.27.0"
  tags                      = var.tags
}
