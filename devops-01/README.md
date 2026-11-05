Terraform Local no Linux

Objetivo deste projeto e criar um modelo reutilizavel de VMs locais utilizando Terraform, o servico de virtualizacao QEMU/KVM/HVF com LibVirt e a interface Virt Manager.

Os conteudos utilizados para leitura e aprendizado dos topicos utilizados neste projeto sao:
-Terraform Documentation: https://developer.hashicorp.com/terraform/language
-Terraform Module Best Practices: https://developer.hashicorp.com/terraform/language/modules/develop/composition
-Terraform Sensitive Data: https://developer.hashicorp.com/terraform/language/manage-sensitive-data
-Terraform Dmacvicar Libvirt Provider: https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs
-Terraform Dmacvicar Libvirt GitHub: https://github.com/dmacvicar/terraform-provider-libvirt
-Cloud-Init Modules: https://docs.cloud-init.io/en/latest/reference/modules.html
-Infraestrutura Modular KVM/LIBVIRT: https://geanmartins.com.br/posts/infra-modular-terraform-kvm/

Estrutura do projeto
├── cloud-init/                    # Templates de configuração Cloud-Init
│   ├── network_config.yml         # Template para configuração de rede das VMs
│   └── user_data.yml              # Template para configuração de usuários e sistema
├── environments/                  # Configurações específicas para cada ambiente
│   └── production/                # Exemplo de ambiente de produção
│       ├── main.tf                # Orquestração dos módulos para o ambiente
│       ├── networks.auto.tfvars   # Definição de redes para o ambiente
│       ├── outputs.tf             # Saídas de dados do ambiente
│       ├── providers.tf           # Provedores específicos do ambiente
│       ├── servers.auto.tfvars    # Definição de servidores para o ambiente
│       ├── terraform.tfvars       # Variáveis globais do ambiente
│       └── variables.tf           # Declaração de variáveis do ambiente
└── modules/                       # Módulos reutilizáveis da infraestrutura
    ├── compute/                   # Módulo para criação de VMs (domínios libvirt)
    │   ├── cloudinit.tf           # Criação de discos Cloud-Init
    │   ├── main.tf                # Definição principal das VMs
    │   ├── outputs.tf             # Saídas de dados do módulo compute
    │   ├── variables.tf           # Variáveis de entrada do módulo compute
    │   └── versions.tf            # Versões de provedores para o módulo compute
    ├── network/                   # Módulo para criação de redes libvirt
    │   ├── main.tf                # Definição principal das redes
    │   ├── outputs.tf             # Saídas de dados do módulo network
    │   ├── variables.tf           # Variáveis de entrada do módulo network
    │   └── versions.tf            # Versões de provedores para o módulo network
    └── storage/                   # Módulo para criação de volumes de armazenamento
        ├── main.tf                # Definição principal dos volumes
        ├── outputs.tf             # Saídas de dados do módulo storage
        ├── variables.tf           # Variáveis de entrada do módulo storage
        └── versions.tf            # Versões de provedores para o módulo storage