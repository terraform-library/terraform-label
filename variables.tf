variable "name" {
  description = "Name, e.g. 'api' or 'jenkins'"
}

variable "environment" {
  description = "Environment, e.g. 'prod', 'uat', 'dev', or 'test'"
}

variable "managedby" {
  description = "Managedby, which could be organization name, e.g. 'DevOps Team' or 'Terraform'"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

variable "delimiter" {
  type        = "string"
  default     = "-"
  description = "Delimiter to be used between `name`, `environment`, `managedby`, etc."
}
