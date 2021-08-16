resource "openstack_networking_network_v2" "terraform-net" {
	name           = "terraform-net"
	admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "subnet1" {
	name = "terraform-subnet"
	network_id = "${openstack_networking_network_v2.terraform-net.id}"
	cidr       = "192.168.109.0/24"
	gateway_ip = "192.168.109.1"
	ip_version = 4
	allocation_pool {
		start = "192.168.109.100"
		end = "192.168.109.200"
	}
}

resource "openstack_networking_router_v2" "router_1" {
	name                = "tf-net-router"
	external_network_id = "b32ae8ee-391a-4f6d-9307-30eedd6833a8"
}

resource "openstack_networking_router_interface_v2" "router_interface_1" {
	router_id = "${openstack_networking_router_v2.router_1.id}"
	subnet_id = "${openstack_networking_subnet_v2.subnet1.id}"
}
