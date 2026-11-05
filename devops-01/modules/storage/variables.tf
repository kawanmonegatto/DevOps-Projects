variable "pool_name" {
  type = string
  default = "image_cluster"
}

variable "pool_path" {
  type = string
  description = "value"
  default = "/var/lib/libvirt/images/"
}

variable "pool" {
  type    = string
  default = "main_pool"
}

variable "base_volume_name" {
  type = string
}

variable "base_image_url" {
  type = string
}

variable "vm_volume_name" {
  type = string
}

variable "vm_capacity" {
  type    = number
  default = 10737418240 # 10 GiB in bytes
}