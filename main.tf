terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

resource "cloudflare_record" "mx" {
  for_each = {
    primary   = { server = "in1-smtp.messagingengine.com", priority = 10 }
    secondary = { server = "in2-smtp.messagingengine.com", priority = 20 }
  }

  zone_id  = var.cf_zone_id
  name     = var.sub_domain
  type     = "MX"
  value    = each.value.server
  ttl      = var.ttl
  priority = each.value.priority
}

resource "cloudflare_record" "spf" {
  count   = var.spf_enable ? 1 : 0
  zone_id = var.cf_zone_id
  name    = var.sub_domain
  type    = "TXT"
  value   = "v=spf1 include:spf.messagingengine.com ?all "
  ttl     = var.ttl
}



resource "cloudflare_record" "dkim" {
  for_each = { for i in(var.dkim_enable ? range(1, 4) : []) : "${i}" => i }
  zone_id  = var.cf_zone_id
  type     = "CNAME"
  name     = "fm${each.value}._domainkey"
  value    = "fm${each.value}.${var.domain_name}.dkim.fmhosted.com"
  ttl      = var.ttl
}

resource "cloudflare_record" "dmarc" {
  count   = length(var.dmarc) > 0 ? 1 : 0
  zone_id = var.cf_zone_id
  name    = "_dmarc"
  type    = "TXT"
  value   = var.dmarc
  ttl     = var.ttl
}
