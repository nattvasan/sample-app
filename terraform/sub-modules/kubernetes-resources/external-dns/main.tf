resource "kubernetes_namespace" "application_namespace" {
  metadata {
    name = var.application_namespace
  }
}

resource "helm_release" "external_dns" {
  for_each = local.config

  repository       = "https://charts.bitnami.com/bitnami"
  namespace        = kubernetes_namespace.application_namespace.metadata[0].name
  create_namespace = false
  lint             = true
  name             = "external-dns-${each.key}"
  version          = var.external_dns_version
  chart            = "external-dns"
  force_update     = true
  wait             = true
  recreate_pods    = false

  values = [
    jsonencode({
      sources          = ["ingress", "service"]
      policy           = "sync"
      txtOwnerId       = "${local.serviceaccount_name}-${var.cluster_name}-${var.env}-${each.key}"
      domainFilters    = each.value.domain_filters
      annotationFilter = lookup(each.value, "annotation_filter", "")
      logLevel         = var.log_level
    }),
    jsonencode({
      podLabels = {
        "azure.workload.identity/use" = "true"
      }
      serviceAccount = {
        annotations = {
          "azure.workload.identity/client-id" = azurerm_user_assigned_identity.external_dns.client_id
        }
      }
      provider  = each.value.provider
      ("azure") = each.value.provider_config
    }),
    jsonencode(lookup(each.value, "service_account", {})),
    jsonencode({
      resources = {
        limits = {
          memory = "50Mi"
          cpu    = "100m"
        }
        requests = {
          memory = "50Mi"
          cpu    = "10m"
        }
      }
    }),
    jsonencode({
      metrics = {
        enabled = true
        serviceMonitor = {
          enabled = true
        }
      }
    })
  ]
}
