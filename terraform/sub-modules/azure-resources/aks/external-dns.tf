module "external_dns" {
  source                  = "../../kubernetes-resources/external-dns"
  subscription_id         = var.subscription_id
  tenant_id               = var.tenant_id
  application_namespace   = "external-dns"
  resource_group          = var.resource_group
  hub_resource_group      = var.hub_resource_group
  location                = var.location
  cluster_name            = module.aks.cluster_name
  cluster_oidc_issuer_url = module.aks.cluster_oidc_issuer_url
  private_dns_zone        = var.private_dns_zone
  public_domains = {
    azure = concat([var.public_dns_zone.name], var.additional_public_domains.azure)
  }
  enable_public_domains      = var.external_dns_enable_public_domains
  env                        = var.env
  private_ingress_class_name = local.private_ingress_class_name
  public_ingress_class_name  = local.public_ingress_class_name
  kubelet_object_identity    = module.aks.kubelet_object_identity
  kubelet_client_identity    = module.aks.kubelet_client_identity
  external_dns_version       = var.external_dns_version

  depends_on = [module.aks, module.prometheus]
}
