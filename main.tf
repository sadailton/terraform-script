# Cria duas instancias com o docker instalado.
resource "openstack_compute_instance_v2" "adailton-saraiva" {
  	count = 1
  	name = "terraform-vm-${count.index + 1}"
  	image_name = "ubuntu-20.04.1-server-64bit"
  	flavor_name = "c2.small"
  	user_data = file("./cloud-init.config")
	depends_on = [openstack_networking_network_v2.terraform-net]
	network {
		name = "${openstack_networking_network_v2.terraform-net.name}" #nome da rede

	}
}

