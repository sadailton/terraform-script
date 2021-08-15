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
  user_name   = "adailtons"
  #user_id     = "b54b77398ba44c7c86837b18faa4da12"
  tenant_name = "PRJ_ADAILTONS"
  tenant_id   = "724ea70fa7774d69a2143714b5ca2e40"
  password    = "~Ex[,cLbc8e]ocz"
  auth_url    = "https://10.50.0.159:5000"
  insecure    = "true"
}

# Create a web server
resource "openstack_compute_instance_v2" "adailton-saraiva" {
  count = 2
  name = "terraform-vm-${count.index + 1}"
  image_name = "ubuntu-20.04.1-server-64bit"
  flavor_name = "c2.small"
  user_data = file("./cloud-init.config")
	network {
		name = "compnuvem"

	}
}

