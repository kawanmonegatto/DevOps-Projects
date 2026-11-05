variable "name" {
  type = string
}

variable "memory" {
  type    = number
  default = 2048
}

variable "vcpu" {
  type    = number
  default = 2
}

variable "network_name" {
  type = string
}

variable "disk_volume_id" {
  type = string
}

variable "user_data" {
  type = string
}

variable "network_config" {
  type    = string
  default = ""
}

variable "pool" {
  type    = string
  default = "default"
}