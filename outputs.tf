output "id" {
  description = "Azure Container Registry ID."
  value       = azurerm_container_registry.main.id
}

output "resource" {
  description = "Azure Container Registry resource output."
  value       = azurerm_container_registry.main
}

output "module_diagnostics" {
  description = "Diagnostics Settings module output."
  value       = module.diagnostics
}

output "name" {
  description = "Azure Container Registry name."
  value       = azurerm_container_registry.main.name
}

output "login_server" {
  description = "URL that can be used to log into the Container Registry."
  value       = azurerm_container_registry.main.login_server
}

output "fqdn" {
  description = "Azure Container Registry FQDN."
  value       = azurerm_container_registry.main.login_server
}

output "admin_username" {
  description = "Username associated with the Container Registry admin account - if the admin account is enabled."
  value       = azurerm_container_registry.main.admin_username
}

output "admin_password" {
  description = "Password associated with the Container Registry admin account - if the admin account is enabled."
  value       = azurerm_container_registry.main.admin_password
  sensitive   = true
}
