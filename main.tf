locals {
  context         = "/var/apps/${var.id}"
  templates       = "${path.module}/templates"
} 

output "rendered" {
  value = {
    cloudconfig = templatefile("${local.templates}/cloud-config.tpl", {

      app_context  = local.context
      ssh_keys     = yamlencode(var.ssh_keys)

      runcmd = base64encode(templatefile("${local.templates}/run.sh", {
        app_context     = local.context
        compose_version = "1.29.0"
        compose_image   = "docker/compose"
      }))

      compose_file = base64encode(templatefile("${local.templates}/docker-compose.yaml", {
        app_context     = local.context
        domain          = var.domain
        subdomains      = var.subdomains
        email           = var.email
        timezone        = var.timezone
        challenge_type  = var.challenge_type
        staging         = var.staging
        only_subdomains = var.only_subdomains
      }))

    })
  }
}