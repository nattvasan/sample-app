resource "helm_release" "prometheus" {
  repository       = "https://prometheus-community.github.io/helm-charts"
  namespace        = kubernetes_namespace.application_namespace.metadata.0.name
  create_namespace = false
  lint             = true
  name             = "prometheus"
  version          = var.prometheus_version
  chart            = "kube-prometheus-stack"
  force_update     = true
  wait             = false
  recreate_pods    = false
  values = [
    templatefile("${path.module}/files/prometheus-values.yaml.tftpl", {
    })
  ]
}
