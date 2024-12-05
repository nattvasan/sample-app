resource "vault_jwt_auth_backend" "azure_oidc" {
  description        = "OIDC backend"
  oidc_discovery_url = "https://login.microsoftonline.com/${var.tenant_id}/v2.0"
  path               = "oidc"
  type               = "oidc"
  oidc_client_id     = var.client_id
  oidc_client_secret = var.client_secret
  default_role       = "azure"
  tune {
    default_lease_ttl = "24h"
    max_lease_ttl     = "48h"
    token_type        = "default-service"
  }
}

resource "vault_jwt_auth_backend_role" "azure_role" {
  role_name             = "azure"
  backend               = vault_jwt_auth_backend.azure_oidc.path
  user_claim            = "email"
  groups_claim          = "groups"
  role_type             = "oidc"
  oidc_scopes           = var.oidc_scopes
  allowed_redirect_uris = var.allowed_redirect_uris
  token_policies = [
    "default",
    "azure_developers"
  ]
  token_ttl     = "86400"
  token_max_ttl = "172800"
}

data "azuread_client_config" "current" {}
