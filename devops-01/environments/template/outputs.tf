output "network_name" {
  value = module.network.name
}

output "server_ids" {
  value = { for k, v in module.compute : k => v.domain_id }
}