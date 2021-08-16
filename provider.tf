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
        user_name       = "adailtons"           #Nome do usuario no openstack
        password        = "~Ex[,cLbc8e]ocz"     #Senha do usuario
        tenant_name     = "PRJ_ADAILTONS"       #Nome do projeto
        tenant_id       = "724ea70fa7774d69a2143714b5ca2e40"                    #ID do projeto
        auth_url        = "https://200.137.75.159:5000"
        cacert_file     = "./root.crt"
        insecure        = "true"
}
