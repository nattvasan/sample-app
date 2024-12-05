#############################################
#1. add dns record set  using terraform
#2. Create argocd namespace
#3. deploy argocd using helm chart from package registry
#############################################

resource "kubernetes_namespace" "argocd" {
  metadata {
    name = "argocd"
  }

}

resource "helm_release" "argocd" {
  name       = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argo-cd"
  version    = var.argo_helm_chart_version
  namespace  = kubernetes_namespace.argocd.metadata[0].name

  set {
    name  = "server.service.type"
    value = "LoadBalancer"
  }

  set {
    name  = "crds.install"
    value = var.install_crds
  }

  depends_on = [
    kubernetes_namespace.argocd,
  ]
}

resource "helm_release" "argocd" {
  depends_on = [
    kubernetes_namespace.argocd,
  ]
  name       = "argo"
  chart      = "argo-cd"
  repository = "https://argoproj.github.io/argo-helm"
  namespace  = kubernetes_namespace.argocd.id
  version    = var.argo_helm_chart_version
  values = [
    "${templatefile(format("%s%s%s", "argocd-values/argocd/", "env", "-values.yaml"), {
      env = var.environment_long
    })}",
    yamlencode({
      metrics = {
        enabled = true
        serviceMonitor = {
          enabled = true
        }
      },
      server = {
        ingress = {
          enabled          = true
          hosts            = ["argocd.testing.com"]
          ingressClassName = "internal"
          annotations = {
            "kubernetes.io/ingress.provider" = "nginx"
            "kubernetes.io/ingress.class"    = "internal"
          }
        }
      },
      configs = {
        params = {
          "server.insecure"     = true
          "server.disable.auth" = false
        },
        cm = {
          url = "https://argocd.testinapp.com"
        }
      }
    })
  ]
  set {
    name  = "crds.install"
    value = var.install_crds
  }
  set {
    name  = "server.metrics.enabled"
    value = true
  }
  set {
    name  = "controller.metrics.enabled"
    value = true
  }
  set {
    name  = "repoServer.metrics.enabled"
    value = true
  }
}

resource "helm_release" "argocd_apps" {
  name       = "argocd-apps"
  repository = "https://argoproj.github.io/argo-helm"
  chart      = "argocd-apps"
  version    = var.argocd_apps_chart_version
  namespace  = kubernetes_namespace.argocd.metadata[0].name
  values = [
    file("../../modules/argocd-values/argocd-app-values/values.yaml")
  ]
  depends_on = [
    helm_release.argocd,
  ]
}

resource "helm_release" "argocd_resources" {
  depends_on = [
    helm_release.argocd,
  ]
  name      = "argocd-resources"
  chart     = "../../modules/argocd-values/argocd-apps/helm"
  namespace = kubernetes_namespace.argocd.id
  version   = "0.1.0"
  values = [
    file("../../modules/argocd-values/argocd-apps/helm/values.yaml")
  ]
}
