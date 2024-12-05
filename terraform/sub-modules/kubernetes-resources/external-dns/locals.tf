locals {
  serviceaccount_name = "external-dns"
  role_name           = "${local.serviceaccount_name}-${var.cluster_name}-${var.env}"

  config = merge(
    {
      azure-private = {
        provider = "azure-private-dns"
        provider_config = {
          resourceGroup                = var.hub_resource_group == null ? var.resource_group.name : var.hub_resource_group.name
          tenantId                     = var.tenant_id
          subscriptionId               = var.subscription_id
          useWorkloadIdentityExtension = true
        }
        annotation_filter = "kubernetes.io/ingress.class in (${var.private_ingress_class_name})"
        domain_filters    = [var.private_dns_zone.name]
      },
    },
    var.enable_public_domains && length(var.public_domains.azure) > 0 ? {
      azure-public = {
        provider = "azure"
        provider_config = {
          resourceGroup                = var.hub_resource_group == null ? var.resource_group.name : var.hub_resource_group.name
          tenantId                     = var.tenant_id
          subscriptionId               = var.subscription_id
          useWorkloadIdentityExtension = true
        }
        annotation_filter = "kubernetes.io/ingress.provider in (${var.public_ingress_class_name})"
        domain_filters    = var.public_domains.azure
      }
    } : null,
  )
}
