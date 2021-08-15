# terraform-script
Script em Terraform para criar instancias no OpenStack

Este documento descreve como executar um script Terraform que cria instâncias no OpenStack.  
Esse script foi escrito para o trabalho da disciplina de Computação em Nuvem do curso de Mestrado Profissional em Computação Aplicada do professor Maxwell.

Autor: Adailton Saraiva  
Data: 15/08/2021

Para instalar o Terraform siga as instruções do site oficial: https://www.terraform.io/downloads.html.  
O sistema utilizado para o desenvolvimento desse trabalho foi o ubuntu-20.04.  

1 - Crie uma pasta chamada terraform-adailton.  
`$ mkdir terraform-adailton`

2 - Entre na pasta terraform-adailton e clone o repositório dentro dela.  
```$ cd terraform-adailton
$ git clone https://github.com/sadailton/terraform-script
```

3 - Abra o arquivo main.tf e preencha o valor das variáveis com o seu login, nome do projeto, id do projeto e nome da rede. Segue abaixo um exemplo:  

```php
#Configurando o provider OpenStack
provider "openstack" {
	user_name   = "adailton" #Nome do usuario no openstack  	
	password    = "123" #Senha do usuario  
	tenant_name = "PRJ_ADAILTON" #Nome do projeto  
	tenant_id   = "724ea70fa7774d69a2143714b5ca2e50" #ID do projeto  
	auth_url    = "https://20.137.75.159:5000"  
	insecure    = "true"  
}  
	
#Configurando a instância a ser criada.
resource "openstack_compute_instance_v2" "adailton-saraiva" {	
	count = 2	
	name = "terraform-vm-${count.index + 1}"	
	image_name = "ubuntu-20.04.1-server-64bit"	
	flavor_name = "c2.small"	
	user_data = file("./cloud-init.config")	
	network {	
		name = "minha_rede" #nome da rede	

	}	
}
```
