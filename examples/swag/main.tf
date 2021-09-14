module "swag" {
    source          = "../../"
    name            = "swag"
    domain          = "domain.tld"
    subdomains      = "www,"
    email           = "admin@domain.tld"
    timezone        = "Europe/Zurich"
    challenge_type  = "http"
    only_subdomains = "true"
    staging         = "true"
    ssh_keys        = [file("~/.ssh/id_rsa.pub"),file("~/.ssh/id_rsa.pub")]
}
output "config" {
    value = module.swag.rendered
}