
# Configuracion del proveedor Cloudflare
provider "cloudflare" {
  api_token = var.api_token
}

# Modulo de infraestructura Cloudflare
module "cloudflare_app" {
  source = "./modules/cloudflare-app"

  account_id       = var.account_id
  worker_name      = var.worker_name
  d1_database_name = var.d1_database_name
}
