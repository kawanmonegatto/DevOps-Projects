output "domain_id" {
  value = libvirt_domain.this.id
}

output "domain_name" {
  value = libvirt_domain.this.name
}