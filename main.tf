terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.43.0"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "" #Nome do usuario no openstack
  password    = "" #Senha do usuario
  tenant_name = "" #Nome do projeto
  tenant_id   = "" #ID do projeto
  auth_url    = "https://20.137.75.159:5000"
  insecure    = "true"
}

# Cria duas instancias com o docker instalado.
resource "openstack_compute_instance_v2" "adailton-saraiva" {
  count = 2
  name = "terraform-vm-${count.index + 1}"
  image_name = "ubuntu-20.04.1-server-64bit"
  flavor_name = "c2.small"
  user_data = file("./cloud-init.config")
	network {
		name = "" #nome da rede

	}
}

