output "eip_id" {
  description = "The ID of the elastic IP"

  value = module.eip_publicip.eip_id
}

output "eip_ipv4_address" {
  description = "The IPv4 address of the elastic IP"

  value = module.eip_publicip.eip_ipv4_address
}

output "eip_status" {
  description = "The status of the elastic IP"

  value = module.eip_publicip.eip_status
}
