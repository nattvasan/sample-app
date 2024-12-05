module "argocd" {
  providers = {
    azurerm.hub = azurerm.hub
  }
  source                       = "../../sub-modules/kubernetes-resources/argocd"
  config_path                  = var.config_path
  argocd_apps_chart_version    = var.argocd_apps_chart_version
  argo_helm_chart_version      = var.argo_helm_chart_version
  install_crds                 = var.install_crds
  tags                         = var.tags
  keep_crds                    = var.keep_crds
  depends_on = [
    module.aks,
  ]
}