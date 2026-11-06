
output "worker_name" {
  description = "Nombre del Worker creado"
  value       = cloudflare_workers_script.hello.script_name
}

output "d1_database_id" {
  description = "ID de la base de datos D1"
  value       = cloudflare_d1_database.app.id
}
