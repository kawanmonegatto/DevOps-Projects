output "name" {
  value = libvirt_network.this.name
}

output "bridge" {
  #value = try(libvirt_network.this.bridge[0].name, null)
  value = try(libvirt_network.this.bridge.name, null)
}