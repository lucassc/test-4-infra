
variable "location" {
  default     = "westeurope"
  description = "Location of the resource group."
}

variable "environment" {
  default     = "dev"
  description = "The environment"
}

variable "tags" {
  type = map(any)
  default = {
    project = "test-4-infra"
    purpose = "jump-station"

  }
  description = "Resource tags"
}

variable "project_name" {
  default     = "test-4-infra"
  description = "The project name"
}

variable "subnet_jump_station_resource_group" {
  default     = "test-target-dev-network-rg"
  description = "The resource group where the jump station subnet was created"
}

variable "subnet_jump_station_name" {
  default     = "test-target-dev-jump-station-subnet"
  description = "The subnet name where the jump station will be created"
}

variable "vnet_jump_station_name" {
  default     = "test-target-dev-vnet"
  description = "The vNet name where the jump station will be created"
}

variable "jump_station_resource_group" {
  default     = "test-target-dev-jump-station-rg"
  description = "The resource group where the jump station was created"
}

variable "jump_station_name" {
  default     = "test-target-dev-jump-station-vm"
  description = "The jump station name"
}
