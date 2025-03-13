######################################################################
# Public configurations
######################################################################

variable "enterprise_project_id" {
  description = "Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users)"

  type        = string
  default     = ""
}

######################################################################
# Configurations of EIP resource and related resources
######################################################################

variable "is_eip_create" {
  description = "Controls whether an elastic IP should be created"

  type     = bool
  default  = true
  nullable = false
}

variable "eip_publicip_configuration" {
  description = "The configuration for the elastic IP"

  type = list(object({
    type       = optional(string, "")
    ip_address = optional(string, "")
    ip_version = optional(string, "")
  }))
  default  = []
  nullable = false
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
  default  = []
  nullable = false
}

variable "eip_name" {
  description = "The name of the elastic IP"

  type    = string
  default = ""
}

variable "eip_tags" {
  description = "The key/value pairs to associate with the elastic IP"

  type    = map(string)
  default = {}
}

variable "eip_charging_mode" {
  description = "The charging mode of the elastic IP"

  type    = string
  default = ""
}

variable "eip_period_unit" {
  description = "The charging period unit of the elastic IP"

  type    = string
  default = ""
}

variable "eip_period" {
  description = "The charging period number of the elastic IP"

  type    = string
  default = ""
}

variable "eip_auto_renew" {
  description = "Whether auto-renew function of the elastic IP is enabled"

  type    = bool
  default = null
}

variable "eip_associates_configuration" {
  description = "The configuration of the EIP associations"

  type = list(object({
    publicip_id             = optional(string, "")
    associate_instance_type = string
    associate_instance_id   = string
  }))
  default  = []
  nullable = false
}
