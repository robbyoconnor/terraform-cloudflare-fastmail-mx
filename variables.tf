variable "cf_api_token" {
  description = "This is the API token. You can obtain it at https://dash.cloudflare.com/profile/api-tokens"
  type        = string
}
variable "cf_zone_id" {
  description = "The ID of the cloudflare zone"
  type        = string
}

variable "domain_name" {
  description = "The apex domain name (e.g., example.com)"
  type        = string
}

variable "sub_domain" {
  default     = "@"
  description = "The sub-domain for the MX records, if applicable (optional)"
  type        = string
}

variable "ttl" {
  default     = 300
  description = "TTL for the DNS records (optional)"
  type        = number
}

variable "dmarc" {
  default     = ""
  description = "DMARC specification (optional)"
  type        = string
}
