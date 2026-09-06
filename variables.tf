variable "cloud_id" {
  description = "Yandex Cloud ID"
  type        = string
}

variable "folder_id" {
  description = "Yandex Folder ID"
  type        = string
}

variable "sa_id" {
  description = "Service account ID"
  type        = string
}

variable "default_zone" {
  description = "Yandex Zone"
  type        = string
  default     = "ru-central1-a"
}

variable "vpc_name" {
  type        = string
  default     = "netology-vpc"
  description = "VPC network name"
}

variable "public_subnet" {
  type        = string
  default     = "public"
  description = "Public subnet name"
}

variable "public_cidr" {
  type        = list(string)
  default     = ["192.168.10.0/24"]
  description = "Public subnet CIDR"
}

variable "private_subnet" {
  type        = string
  default     = "private"
  description = "Private subnet name"
}

variable "private_cidr" {
  type        = list(string)
  default     = ["192.168.20.0/24"]
  description = "Private subnet CIDR"
}

variable "nat_image_id" {
  type        = string
  default     = "fd80mrhj8fl2oe87o4e1"
  description = "NAT instance image ID"
}

variable "ubuntu_image_id" {
  type        = string
  default     = "fd84h56p8ucfgqroscfv"
  description = "Ubuntu 20.04 image ID"
}

variable "nat_instance_ip" {
  type        = string
  default     = "192.168.10.254"
  description = "NAT instance internal IP"
}

variable "bucket_name" {
  type        = string
  default     = "slov-20260906"
  description = "Name for the storage bucket"
}

variable "image_path" {
  type        = string
  default     = "~/hw/clopro-homeworks-15.2/img/picture.jpg"
  description = "Local path to the image file"
}

variable "lamp_group_name" {
  type        = string
  default     = "lamp-group"
  description = "LAMP group"
}

variable "lamp_image_id" {
  type        = string
  default     = "fd827b91d99psvq5fjit"
  description = "LAMP instance image ID"
}

variable "network_nlb" {
  type        = string
  default     = "nlb"
  description = "Network load balancer"
}