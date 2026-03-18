resource "azurerm_resource_group" "rg" {
  name     = "Antoine_final_eval_rg"
  location = "France Central"
}


resource "azurerm_storage_account" "static_site" {
  name                     = "maxencestaticsite"
  resource_group_name      = "Antoine_final_eval_rg"
  location                 = "France Central"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    Evenement= "eval"
  }
}


resource "azurerm_storage_blob" "index" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "index.html"
  content_type           = "text/html"
}


resource "azurerm_storage_blob" "error" {
  name                   = "error.html"
  storage_account_name   = azurerm_storage_account.static_site.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "error.html"
  content_type           = "text/html"
}


output "static_website_url" {
  description = "URL of the static website"
  value       = azurerm_storage_account.static_site.primary_web_endpoint
}
