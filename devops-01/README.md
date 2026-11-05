# Terraform Local no Linux

Este projeto tem como objetivo criar uma infraestrutura local modular e reutilizável para provisionamento de máquinas virtuais utilizando Terraform.

## Tecnologias Usadas

- [Terraform](https://developer.hashicorp.com/terraform)
- [QEMU/KVM](https://www.qemu.org/)
- [LibVirt](https://libvirt.org/)
- [Virt Manager](https://virt-manager.org/)
- [Cloud-Init](https://docs.cloud-init.io/en/latest/)
- [Provider dmacvicar/libvirt](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs)
- [GitHub dmacvicar/libvirt](https://github.com/dmacvicar/terraform-provider-libvirt)

## Estrutura do Projeto

| Modulos | Descricao                                         |
| ------- |:-------------------------------------------------:|
| Compute | Criação das VMs (domínios LibVirt) com Cloud-Init |
| Network | Criação e gerenciamento de redes LibVirt          |
| Storage | Criação de volumes de armazenamento               |

```
devops-project/
├── cloud-init/                    # Configuração do Cloud-Init
│   ├── network_config.yml         # Configuração de rede das VMs
│   └── user_data.yml              # Configuração de usuários e sistema
├── environments/                  # Configurações específicas para cada ambiente
│   └── Template/                  # Pasta de configuracoes do Ambiente
│       ├── main.tf                # Orquestração dos módulos
│       ├── networks.auto.tfvars   # Definição de redes
│       ├── outputs.tf             # Saídas de dados
│       ├── providers.tf           # Provedores específicos
│       ├── servers.auto.tfvars    # Definição de Servidores/VMs
│       ├── terraform.tfvars       # Variáveis globais
│       └── variables.tf           # Declaração de variáveis
└── modules/                       # Módulos reutilizáveis
    ├── compute/                   # Módulo para criação de VMs (domínios libvirt)
    │   ├── cloudinit.tf
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── variables.tf
    │   └── versions.tf
    ├── network/                   # Módulo para criação de redes libvirt
    │   ├── main.tf
    │   ├── outputs.tf
    │   ├── variables.tf
    │   └── versions.tf
    └── storage/                   # Módulo para criação de volumes de armazenamento
        ├── main.tf
        ├── outputs.tf
        ├── variables.tf
        └── versions.tf
```

## Como usar

`[404 not found - Under Construction]`

## Referencias

Os conteudos utilizados para leitura e aprendizado dos topicos utilizados neste projeto sao:
- [Terraform Documentation](https://developer.hashicorp.com/terraform/language)
- [Terraform Module Best Practices](https://developer.hashicorp.com/terraform/language/modules/develop/composition)
- [Terraform Sensitive Data](https://developer.hashicorp.com/terraform/language/manage-sensitive-data)
- [Terraform Dmacvicar/Libvirt Provider](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs)
- [Terraform Dmacvicar/Libvirt GitHub](https://github.com/dmacvicar/terraform-provider-libvirt)
- [Cloud-Init Documentation](https://docs.cloud-init.io/en/latest/reference/modules.html)
- [Infraestrutura Modular KVM/LIBVIRT](https://geanmartins.com.br/posts/infra-modular-terraform-kvm/)