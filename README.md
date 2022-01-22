# Terraform Module to set-up the MX Records for [fastmail](https://fastmail.com)



This was developed primarily for myself, but I am releasing it in the hopes it helps someone else. This works only with Cloudflare DNS.

This will create the DNS records necessary to set up your domain name with fastmail. This configures SPF, DKIM, and DMARC properly as well.

This can be found on the [Terraform Registry](https://registry.terraform.io/modules/robbyoconnor/fastmail-mx/cloudflare/latest).

## Example usage

```terraform
terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 3.0"
    }
  }
}

provider "cloudflare" {
  api_token = var.cf_api_token
}

module "fastmail" {
  source          = "robbyoconnor/fastmail-mx/cloudflare"
  version         = "1.0.0"
  cf_zone_id      = var.cf_zone_id
  cf_api_token    = var.cf_api_token
  domain_name = "example.com"
}
```
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | ~> 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | ~> 3.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [cloudflare_record.dkim](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.dmarc](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.mx](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |
| [cloudflare_record.spf](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/record) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cf_api_token"></a> [cf\_api\_token](#input\_cf\_api\_token) | This is the API token. You can obtain it at https://dash.cloudflare.com/profile/api-tokens | `string` | n/a | yes |
| <a name="input_cf_zone_id"></a> [cf\_zone\_id](#input\_cf\_zone\_id) | The ID of the cloudflare zone | `string` | n/a | yes |
| <a name="input_dmarc"></a> [dmarc](#input\_dmarc) | DMARC specification (optional) | `string` | `""` | no |
| <a name="input_domain_name"></a> [domain\_name](#input\_domain\_name) | The apex domain name (e.g., example.com) | `string` | n/a | yes |
| <a name="input_sub_domain"></a> [sub\_domain](#input\_sub\_domain) | The sub-domain for the MX records, if applicable (optional) | `string` | `"@"` | no |
| <a name="input_ttl"></a> [ttl](#input\_ttl) | TTL for the DNS records (optional) | `number` | `300` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
