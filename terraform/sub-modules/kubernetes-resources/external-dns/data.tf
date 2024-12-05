data "azurerm_subscription" "current" {
}

data "azurerm_dns_zone" "public" {
  for_each = toset(var.public_domains.azure)

  name = each.value
}
