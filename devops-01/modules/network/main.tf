resource "libvirt_network" "this" {
  name      = var.name
  autostart = var.autostart

  forward = var.forward_mode != null ? {
    mode = var.forward_mode
  } : null

  bridge = var.bridge_name != null ? {
    name = var.bridge_name
  } : null

  ips = [
    {
      family  = "ipv4"
      address = var.ip_address
      netmask = var.netmask

      dhcp = (var.dhcp_start != null && var.dhcp_end != null) ? {
        ranges = [
          {
            start = var.dhcp_start
            end   = var.dhcp_end
          }
        ]
      } : null
    }
  ]
}