terraform {
  required_version = ">= 1.0"
}

locals {
  context   = "/var/apps/${var.id}"
  templates = "${path.module}/templates"
  runcmd = {
    app_context     = local.context
    compose_version = "1.29.0"
    compose_image   = "docker/compose"
  }
  compose = {
    app_context     = local.context
    domain          = var.domain
    subdomains      = var.subdomains
    email           = var.email
    timezone        = var.timezone
    challenge_type  = var.challenge_type
    staging         = var.staging
    only_subdomains = var.only_subdomains
  }
}