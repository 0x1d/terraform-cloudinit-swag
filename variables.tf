variable "name" {
  description = "Name of the app"
  type = string
}
variable "domain" {
  description = "Domain for reverse proxy and SSL cert"
  type        = string
}

variable "subdomains" {
  description = "Comma separated list of subdomains"
  type        = string
  default     = "www"
}

variable "staging" {
  description = "When true, Let's Encrypt staging is used"
  type    = string
  default = "true"
}

variable "only_subdomains" {
  description = "If true, only enable subdomains on gateway"
  type = string
  default = true
}

variable "email" {
  type    = string
  default = ""
}

variable "challenge_type" {
  type        = string
  default = "http"
}

variable "ssh_keys" {
  description = "Authorized SSH authorized public keys"
  type        = list
}

variable "timezone" {
  type    = string
  default = "Europe/Zurich"
}