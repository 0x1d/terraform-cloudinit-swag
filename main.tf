locals {
  context         = "/var/apps/${var.name}"
  templates       = "${path.module}/templates"
  domain          = var.domain
  subdomains      = var.subdomains
  email           = var.email
  timezone        = var.timezone
  staging         = var.staging
  only_subdomains = var.only_subdomains
  challenge_type  = var.challenge_type
  ssh_keys        = var.ssh_keys
} 

output "rendered" {
  value = {
    cloudconfig = templatefile("${local.templates}/cloud-config.tpl", {

      app_context  = local.context
      ssh_keys     = yamlencode(local.ssh_keys)

      runcmd = base64encode(templatefile("${local.templates}/run.sh", {
        app_context     = local.context
        compose_version = "1.29.0"
        compose_image   = "docker/compose"
      }))

      compose_file = base64encode(templatefile("${local.templates}/docker-compose.yaml", {
        app_context     = local.context
        domain          = local.domain
        subdomains      = local.subdomains
        email           = local.email
        timezone        = local.timezone
        challenge_type  = local.challenge_type
        staging         = local.staging
        only_subdomains = local.only_subdomains
      }))

    })
  }
}