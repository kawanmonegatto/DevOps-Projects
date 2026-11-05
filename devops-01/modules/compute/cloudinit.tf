resource "libvirt_cloudinit_disk" "this" {
  name           = "${var.name}-cloudinit"
  user_data      = var.user_data
  network_config = var.network_config != "" ? var.network_config : null
  meta_data      = <<-EOF
    instance-id: ${var.name}
    local-hostname: ${var.name}
  EOF
}

resource "libvirt_volume" "cloudinit" {
  name = "${var.name}-cloudinit.iso"
  pool = var.pool

  create = {
    content = {
      url = libvirt_cloudinit_disk.this.path
    }
  }

  target = {
    format = {
      type = "iso"
    }
  }
}