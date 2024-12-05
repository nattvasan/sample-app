################################################################################
# public DNS zone
################################################################################
# testing.com

resource "azurerm_dns_zone" "testingcom" {
  resource_group_name = var.resource_group_name
  name                = "testing.com"
}
