resource "cloudflare_record" "cname_proton_2_domain_key" {
  name    = "protonmail2._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail2.domainkey.${var.domain_key}.domains.proton.ch"
  zone_id = var.zone_id
}

resource "cloudflare_record" "cname_proton_3_domain_key" {
  name    = "protonmail3._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail3.domainkey.${var.domain_key}.domains.proton.ch"
  zone_id = var.zone_id
}

resource "cloudflare_record" "cname_proton_domain_key" {
  name    = "protonmail._domainkey"
  proxied = false
  ttl     = 1
  type    = "CNAME"
  value   = "protonmail.domainkey.${var.domain_key}.domains.proton.ch"
  zone_id = var.zone_id
}

resource "cloudflare_record" "mx_proton_mailsec" {
  name     = var.domain
  priority = 20
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mailsec.protonmail.ch"
  zone_id  = var.zone_id
}

resource "cloudflare_record" "mx_proton_mail" {
  name     = var.domain
  priority = 10
  proxied  = false
  ttl      = 1
  type     = "MX"
  value    = "mail.protonmail.ch"
  zone_id  = var.zone_id
}

resource "cloudflare_record" "txt_proton_spf" {
  name    = var.domain
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=spf1 include:_spf.protonmail.ch mx ~all"
  zone_id = var.zone_id
}

resource "cloudflare_record" "txt_proton_verification" {
  name    = var.domain
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "protonmail-verification=${var.domain_verification}"
  zone_id = var.zone_id
}

resource "cloudflare_record" "txt_proton_dmarc1" {
  name    = "_dmarc"
  proxied = false
  ttl     = 1
  type    = "TXT"
  value   = "v=DMARC1; p=none"
  zone_id = var.zone_id
}
