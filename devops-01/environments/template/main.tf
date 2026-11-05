module "network" {
  source = "../../modules/network"

  name         = var.network.name
  forward_mode = var.network.forward
  bridge_name  = var.network.bridge_name
  ip_address   = var.network.ip_address
  netmask      = var.network.netmask
  dhcp_start   = var.network.dhcp_start
  dhcp_end     = var.network.dhcp_end
}

module "storage" {
  source   = "../../modules/storage"
  for_each = var.servers

  base_volume_name = "${each.key}-base.qcow2"
  base_image_url   = var.base_image_url
  vm_volume_name   = "${each.key}-disk.qcow2"
  vm_capacity      = each.value.disk_size
}

module "compute" {
  source   = "../../modules/compute"
  for_each = var.servers

  name           = each.key
  memory         = each.value.memory
  vcpu           = each.value.vcpu
  network_name   = module.network.name
  disk_volume_id = module.storage[each.key].vm_volume_id

  user_data = templatefile("${path.root}/../../cloud-init/user_data.yml", {
    user_name = "main"
    gecos     = "User Account"
    groups    = ["adm", "sudo", "users"]
    ssh_key   = var.ssh_public_key
    hostname : "libvirt"
  })

  network_config = file("${path.root}/../../cloud-init/network_config.yml")
}