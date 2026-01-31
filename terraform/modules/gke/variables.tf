variable "project_id" {
  type = string
}

variable "region" {
  type = string
}

variable "network" {
  type = string
  default = "default"
}

variable "service_account_email" {
  type = string
}
