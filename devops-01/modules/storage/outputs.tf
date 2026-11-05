output "vm_volume_id" {
  value = libvirt_volume.vm.id
}

output "vm_volume_path" {
  value = libvirt_volume.vm.path
}

output "base_volume_path" {
  value = libvirt_volume.base.path
}