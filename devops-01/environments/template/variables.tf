variable "ssh_public_key" {
  type = string
}

variable "base_image_url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
}

variable "network" {
  type = object({
    name        = string
    ip_address  = string
    netmask     = string
    dhcp_start  = string
    dhcp_end    = string
    forward     = string
    bridge_name = optional(string)
  })
}

variable "servers" {
  type = map(object({
    memory    = number
    vcpu      = number
    disk_size = number
  }))
}