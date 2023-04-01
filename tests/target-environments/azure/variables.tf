variable "environment" {
  default     = "dev"
  description = "The environment"
}

variable "tags" {
  type = map(any)
  default = {
    project = "test-4-infra"
    purpose = "test-target"

  }
  description = "Resource tags"
}

variable "project_name" {
  default     = "test-target"
  description = "The project name"
}
