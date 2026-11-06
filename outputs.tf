
output "worker_name" {
  description = "Nombre del Worker creado"
  value       = module.cloudflare_app.worker_name
}

output "d1_database_id" {
  description = "ID de la base de datos D1"
  value       = module.cloudflare_app.d1_database_id
}
