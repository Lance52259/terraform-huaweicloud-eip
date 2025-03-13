# IPv4 EIP example

Configuration in this directory creates an IPv4 EIP.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan -var-file=variables.json
$ terraform apply -var-file=variables.json
```

Run `terraform destroy -var-file=variables.json` when you don't need these resources.

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

<!-- markdownlint-disable MD013 -->
| Name | Source | Version |
|------|--------|---------|
| eip_publicip | [../../modules/eip-publicip](../../modules/eip-publicip/README.md) | N/A |
<!-- markdownlint-enable MD013 -->

## Resources

No resource.

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Value |
|------|-------------|-------|
| region_name | The region where the resource is located | `"cn-north-4"` |
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `"0"` |
| eip_publicip_configuration | The configuration for the elastic IP | <pre>[<br>  {<br>    "type": "5_bgp",<br>    "ip_version": "4"<br>  }<br>]</pre> |
| eip_bandwidth_configuration | The bandwidth configuration for the elastic IP | <pre>[<br>  {<br>    "share_type": "PER",<br>    "name": "EIP-Bandwidth-Test",<br>    "size": 5<br>  }<br>]</pre> |
| eip_name | The name of the elastic IP | `"EIP-IPv4-PublicIP-Test"` |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| eip_id | The ID of the elastic IP |
| eip_ipv4_address | The IPv4 address of the elastic IP |
| eip_status | The status of the elastic IP |
