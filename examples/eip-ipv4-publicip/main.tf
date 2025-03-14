provider "huaweicloud" {
  region = var.region_name
}

module "eip_publicip" {
  source = "../../modules/eip-publicip"

  enterprise_project_id = var.enterprise_project_id

  eip_publicip_configuration  = var.eip_publicip_configuration
  eip_bandwidth_configuration = var.eip_bandwidth_configuration
  eip_name                    = var.eip_name
}
