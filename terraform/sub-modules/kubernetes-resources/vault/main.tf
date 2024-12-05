resource "kubernetes_namespace" "application_namespace" {
  metadata {
    name = var.application_namespace
  }
}

resource "helm_release" "vault" {
  repository       = "https://helm.releases.hashicorp.com"
  namespace        = kubernetes_namespace.application_namespace.metadata[0].name
  create_namespace = false
  lint             = true
  name             = local.vault_name
  version          = var.vault_version
  chart            = "vault"
  force_update     = true
  wait             = false
  recreate_pods    = true
  values = [
    templatefile("${path.module}/files/values.yaml.tmpl", {
      name               = local.vault_name
      ingress_class      = var.ingress_class
      fqdn               = local.fqdn
      tenant_id          = var.tenant_id
      principal_id       = azuread_application.vault.client_id
      client_secret      = azuread_service_principal_password.vault.value
      keyvault_name      = azurerm_key_vault.key_vault.name
      vault_storage_name = azurerm_storage_account.vault.name
      vault_storage_key  = azurerm_storage_account.vault.primary_access_key
    })
  ]
}
