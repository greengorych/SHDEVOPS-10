variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}
variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}
variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}
variable "vm_web_os_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}
variable "vm_web_inst_name" {
  type        = string
  default     = "netology-develop-platform-web"
}
variable "vm_web_inst_pl_id" {
  type        = string
  default     = "standard-v3"
}
variable "vm_web_cores" {
  type        = number
  default     = 2
}
variable "vm_web_memory" {
  type        = number
  default     = 1
}
variable "vm_web_fraction" {
  type        = number
  default     = 20
}
variable "vm_web_loc_platform" {
  type        = string
  default     = "netology"
}
variable "vm_web_loc_branch" {
  type        = string
  default     = "develop"
}
variable "vm_web_loc_name" {
  type        = string
  default     = "platform-web"
}

variable "vms_ssh_root_key" {
  type        = string
  default     = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILSOXDGT/6lPKrHTx2ZnVrT48T23DMHMy7YZpyEF6rOa root@greengorych"
  description = "ssh-keygen -t ed25519"
}
