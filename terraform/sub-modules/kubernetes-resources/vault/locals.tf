locals {
  vault_name      = "vault"
  fqdn            = "${local.vault_name}.${var.domain}"
  vault_role_id   = ""
  vault_secret_id = ""
}
