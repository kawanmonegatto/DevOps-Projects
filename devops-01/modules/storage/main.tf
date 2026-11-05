# Base Image Pool
resource "libvirt_pool" "main_pool" {
  name = var.pool_name
  type = "dir"
  target = {
    path = var.pool_path
  }
}

# Download base image
resource "libvirt_volume" "base" {
  name = var.base_volume_name
  pool = var.pool

  create = {
    content = {
      url = var.base_image_url
    }
  }

  target = {
    format = {
      type = "qcow2"
    }
  }
}

# CoW overlay for VM disk
resource "libvirt_volume" "vm" {
  name     = "vm.qcow2"
  pool     = "default"
  capacity = 10737418240

  backing_store = {
    path   = libvirt_volume.base.path
    format = {
      type = "qcow2"
    }
  }
}