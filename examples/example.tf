module "example" {
  source       = "../."
  cf_zone_id   = var.cf_zone_id
  cf_api_token = var.cf_api_token
  domain_name  = "example.com"
  dmarc        = var.dmarc
}
