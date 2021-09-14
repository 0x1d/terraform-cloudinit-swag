output "rendered" {
  value = templatefile("${local.templates}/cloud-config.tpl", {
    app_context  = local.context
    ssh_keys     = yamlencode(var.ssh_keys)
    runcmd       = base64encode(templatefile("${local.templates}/run.sh", local.runcmd))
    compose_file = base64encode(templatefile("${local.templates}/docker-compose.yaml", local.compose))
  })

}