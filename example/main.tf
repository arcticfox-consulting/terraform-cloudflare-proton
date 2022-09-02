module "protonmail" {
  # source  = "github.com/arcticfox-consulting/terraform-cloudflare-proton/modules/proton@main"
  source              = "../modules/proton"
  domain              = "example.com"         # Replace with your domain
  zone_id             = "cloudflare_zone_id"  # Replace with your zone id
  domain_key          = "domain_key"          # provided by ProtonMail
  domain_verification = "domain_verification" # provider by ProtonMail
}

resource "cloudflare_record" "root" {
  name    = var.domain
  proxied = true
  ttl     = 1
  type    = "A"
  ip      = "0.0.0.0.0"
  zone_id = var.zone_id
}