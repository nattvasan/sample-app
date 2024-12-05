output "status" {
  description = "Status of the chart deployment"
  value       = helm_release.vault.status
}

output "service_account_name" {
  description = "Service account name"
  value       = local.vault_name
}

output "vault_url" {
  description = "URL of the vault ingress"
  value       = "https://${local.fqdn}"
}

output "mount_accessor" {
  value       = module.azure_auth_vault.mount_accessor
  description = "Mount accessor ID for auth method."
}