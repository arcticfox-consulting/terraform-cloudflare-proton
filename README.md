# terraform-cloudflare-proton

## How to use this module

 Follow the instructions on Proton documentation page: [How to use a custom domain from Cloudflare with Proton Mail](https://proton.me/support/custom-domain-cloudflare) and get the following keys:

- Domain Verification code (`TXT`): `protonmail-verification=<YourUniqueCode>`
- DomainKeys Identified Mail (`CNAME`): `protonmail._domainkey.<YourUniqueDKIMCode>`

`SPF`,`MX` and `DMRAC` records will be created automatically.

Check your cloudflare configuration and get the following values:

- Domain
- [Zone Id](https://developers.cloudflare.com/fundamentals/get-started/basic-tasks/find-account-and-zone-ids/)

## Module Configuration

This module expects you to provide four parameters:

- `domain_key` (Provided by Proton)
- `domain_verification` (Provided by Proton)
- `zone_id` (Provided by Cloudflare)
- `domain` (Provided by Cloudflare)

## Usage

```hcl
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
```

## Requirements

...

## Providers

...
