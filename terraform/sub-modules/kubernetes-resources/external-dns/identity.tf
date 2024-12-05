resource "azurerm_user_assigned_identity" "external_dns" {
  name                = "external_dns"
  resource_group_name = var.resource_group.name
  location            = var.location
}

resource "azurerm_role_assignment" "external_dns_contributor" {
  for_each             = data.azurerm_dns_zone.public
  scope                = each.value.id
  role_definition_name = "DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.external_dns.principal_id

  lifecycle {
    ignore_changes = [
      scope
    ]
  }
}

resource "azurerm_role_assignment" "external_dns_contributor_private" {
  scope                = var.private_dns_zone.id
  role_definition_name = "Private DNS Zone Contributor"
  principal_id         = azurerm_user_assigned_identity.external_dns.principal_id
}

resource "azurerm_role_assignment" "rg_reader" {
  scope                = var.resource_group.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.external_dns.principal_id
}

resource "azurerm_federated_identity_credential" "external_dns_public" {
  name                = "external_dns_public"
  resource_group_name = var.resource_group.name
  issuer              = var.cluster_oidc_issuer_url
  audience            = ["api://AzureADTokenExchange"]
  parent_id           = azurerm_user_assigned_identity.external_dns.id
  subject             = "system:serviceaccount:external-dns:external-dns-azure-public"
}

resource "azurerm_federated_identity_credential" "external_dns_private" {
  name                = "external_dns_private"
  resource_group_name = var.resource_group.name
  issuer              = var.cluster_oidc_issuer_url
  audience            = ["api://AzureADTokenExchange"]
  parent_id           = azurerm_user_assigned_identity.external_dns.id
  subject             = "system:serviceaccount:external-dns:external-dns-azure-private"
}
