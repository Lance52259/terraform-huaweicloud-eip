resource "huaweicloud_vpc_eip" "this" {
  count = var.is_eip_create ? 1 : 0

  enterprise_project_id = var.enterprise_project_id != "" ? var.enterprise_project_id : null

  dynamic "publicip" {
    for_each = var.eip_publicip_configuration

    content {
      type       = publicip.value["type"] != "" ? publicip.value["type"] : null
      ip_address = publicip.value["ip_address"] != "" ? publicip.value["ip_address"] : null
      ip_version = publicip.value["ip_version"] != "" ? publicip.value["ip_version"] : null
    }
  }

  dynamic "bandwidth" {
    for_each = var.eip_bandwidth_configuration

    content {
      share_type  = bandwidth.value["share_type"] != "" ? bandwidth.value["share_type"] : null
      name        = bandwidth.value["name"] != "" ? bandwidth.value["name"] : null
      size        = bandwidth.value["size"]
      id          = bandwidth.value["id"] != "" ? bandwidth.value["id"] : null
      charge_mode = bandwidth.value["charge_mode"] != "" ? bandwidth.value["charge_mode"] : null
    }
  }

  name = var.eip_name
  tags = var.eip_tags

  charging_mode = var.eip_charging_mode != "" ? var.eip_charging_mode : null
  period_unit   = var.eip_period_unit != "" ? var.eip_period_unit : null
  period        = var.eip_period != "" ? var.eip_period : null
  auto_renew    = var.eip_auto_renew

  lifecycle {
    precondition {
      condition     = length(var.eip_publicip_configuration) > 0
      error_message = "The eip_publicip_configurations is required if the is_eip_create is true."
    }
    precondition {
      condition     = length(var.eip_bandwidth_configuration) > 0
      error_message = "The eip_bandwidth_configurations is required if the is_eip_create is true."
    }
  }
}

resource "huaweicloud_vpc_eipv3_associate" "this" {
  count = length(var.eip_associates_configuration)

  publicip_id             = lookup(element(var.eip_associates_configuration, count.index), "publicip_id", "") != "" ? lookup(element(var.eip_associates_configuration,
    count.index), "publicip_id") : var.is_eip_create ? huaweicloud_vpc_eip.this[0].id : ""
  associate_instance_type = lookup(element(var.eip_associates_configuration, count.index), "associate_instance_type", "")
  associate_instance_id   = lookup(element(var.eip_associates_configuration, count.index), "associate_instance_id", "")
}
