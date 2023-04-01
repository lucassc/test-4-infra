
variable "location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "environment" {
  default     = "dev"
  description = "The environment"
}

variable "tags" {
  type        = map(any)
  description = "Resource Tags"
}

variable "project_name" {
  default     = "test-target"
  description = "The project name"
}

variable "module_name" {
  default     = "network"
  description = "The module name or the purpose"
}

variable "virtual_network_address" {
  default     = "10.1.0.0/16"
  description = "vNet address space"
}

variable "bastion_subnet_address" {
  default     = "10.1.10.0/26"
  description = "Jump Station address space"
}

variable "jump_station_subnet_address" {
  default     = "10.1.20.0/24"
  description = "Jump Station address space"
}
