resource "kubernetes_namespace" "application_namespace" {
  metadata {
    name = var.application_namespace
    labels = {
      "azure-workload-identity.io/system" = "true"
    }
  }
}
