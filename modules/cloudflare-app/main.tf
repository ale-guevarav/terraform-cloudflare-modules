
# Base de datos D1
resource "cloudflare_d1_database" "app" {
  account_id = var.account_id
  name       = var.d1_database_name
}

# Worker conectado a D1
resource "cloudflare_workers_script" "hello" {
  account_id         = var.account_id
  script_name        = var.worker_name
  main_module        = "worker.js"
  content_file       = "${path.module}/worker.js"
  content_sha256     = filesha256("${path.module}/worker.js")
  compatibility_date = "2025-10-28"

  bindings = [
    {
      name = "DB"
      type = "d1"
      id   = cloudflare_d1_database.app.id
    }
  ]
}

# Subdominio del Worker
resource "cloudflare_workers_script_subdomain" "hello" {
  account_id  = var.account_id
  script_name = cloudflare_workers_script.hello.script_name
  enabled     = true
}
