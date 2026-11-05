variable "name" {
  type        = string
  description = "Network name"
}

variable "autostart" {
  type    = bool
  default = true
}

variable "forward_mode" {
  type        = string
  default     = "nat"
  description = "Forward mode: nat, route, bridge, or null for isolated"
}

variable "bridge_name" {
  type        = string
  default     = null
}

variable "ip_address" {
  type        = string
}

variable "netmask" {
  type        = string
  default     = "255.255.255.0"
}

variable "dhcp_start" {
  type    = string
  default = null
}

variable "dhcp_end" {
  type    = string
  default = null
}