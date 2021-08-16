# terraform-script
Script em Terraform para criar instancias no OpenStack.  

Este documento descreve como executar um script Terraform que cria instâncias no OpenStack.  
Esse script foi escrito para o trabalho da disciplina de Computação em Nuvem do curso de Mestrado Profissional em Computação Aplicada do professor Maxwell. O script executa as seguintes operações:

* Cria a rede 192.168.109.0/24
* Cria um roteador com uma interface na rede externa e outra na rede interna com o IP 192.168.109.1
* Cria duas instâncias com 2GB de ram 2vCPUs e instala o docker via cloud-init (ver arquivo cloud-init.config).

**Autor:** Adailton Saraiva  
**Data:** 16/08/2021

Para instalar o Terraform siga as instruções do site oficial: https://www.terraform.io/downloads.html.  
O sistema utilizado para o desenvolvimento desse trabalho foi o ubuntu-20.04.  

**1** - Crie uma pasta chamada terraform-project.  
```bash
$ mkdir terraform-project
```

**2** - Entre na pasta terraform-adailton e clone o repositório dentro dela. Em seguida entre no diretório do repositório.
```bash
$ cd terraform-project
$ git clone https://github.com/sadailton/terraform-script
$ cd terraform-script
```

**3** - Abra o arquivo provider.tf e preencha o valor das variáveis com o seu login, nome do projeto e id do projeto. Segue abaixo um exemplo:  

```terraform	
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
        user_name       = "adailton"                            #Nome do usuario no openstack
        password        = "123456"                              #Senha do usuario
        tenant_name     = "MEU_PROJETO"                         #Nome do projeto
        tenant_id       = "724ea70fa7774d69a2143714000000"      #ID do projeto
        auth_url        = "https://200.137.75.159:5000"
        cacert_file     = "./root.crt"
        insecure        = "true"
}
```

**4** - Execute o comando `terraform init` para instalar o plugin do openstack.  
```bash
$ terraform init
```

**5** - Configura o que será executado pelo terraform.  
```bash
$ terraform plan
```

**6** - Execute o script para criar a infraestrutura no OpenStack. Logue no OpenStack para conferir os elementos serem criados.  
```bash
$ terraform apply
```

**7** - Caso queira apagar toda a estrutura criada, execute o comando `terraform destroy`.  
```bash
$ terraform destroy
```
