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
        user_name       = "adailton"           			#Nome do usuario no openstack
        password        = "123456"     				#Senha do usuario
        tenant_name     = "MEU_PROJETO" 			#Nome do projeto
        tenant_id       = "724ea70fa7774d69a2143714000000" 	#ID do projeto
        auth_url        = "https://200.137.75.159:5000"
        cacert_file     = "./root.crt"
        insecure        = "true"
}
