######################################################################
# Public configurations
######################################################################

variable "region_name" {
  description = "The region where the resource is located"

  type = string
}

variable "enterprise_project_id" {
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  type        = string
  default     = ""
}

######################################################################
# Configurations of EIP resource and related resources
######################################################################

variable "eip_publicip_configuration" {
  description = "The configuration for the elastic IP"

  type = list(object({
    type       = optional(string, "")
    ip_address = optional(string, "")
    ip_version = optional(string, "")
  }))
}

variable "eip_bandwidth_configuration" {
  description = "The bandwidth configuration for the elastic IP"

  type = list(object({
    share_type  = string
    name        = optional(string, "")
    size        = optional(string, null)
    id          = optional(string, "")
    charge_mode = optional(string, "")
  }))
}

variable "eip_name" {
  description = "The name of the elastic IP"

  type = string
}
