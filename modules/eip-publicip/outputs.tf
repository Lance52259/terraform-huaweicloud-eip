output "eip_id" {
  description = "The ID of the elastic IP"

  value = try(huaweicloud_vpc_eip.this[0].id, "")
}

output "eip_ipv4_address" {
  description = "The IPv4 address of the elastic IP"

  value = try(huaweicloud_vpc_eip.this[0].address, "")
}

output "eip_ipv6_address" {
  description = "The IPv6 address of the elastic IP"

  value = try(huaweicloud_vpc_eip.this[0].ipv6_address, "")
}

output "eip_associate_id" {
  description = "The associate ID of the elastic IP"

  value = try(huaweicloud_vpc_eipv3_associate.this[0].id, "")
}
