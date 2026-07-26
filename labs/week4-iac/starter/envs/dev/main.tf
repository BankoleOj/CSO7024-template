terraform {

  backend "http" {
    address        = "http://localhost:9090/state/dev"
    lock_address   = "http://localhost:9090/state/dev"
    unlock_address = "http://localhost:9090/state/dev"
    lock_method    = "LOCK"
    unlock_method  = "UNLOCK"
  }

  required_providers {

    random = {
      source = "hashicorp/random"
    }

    local = {
      source = "hashicorp/local"
    }
  }
}

module "server" {
  source = "../../modules/server"
  length = 2
}

output "server_name" {
  value = module.server.server_name
}