# Elastic IP management

Manages the elastic IP resource.

## Notes

### How to import resources in the module structure

If you want to manage an existing elastic IP using Terraform (otherwise why are you reading this?) you need to
make sure that the corresponding module script has been defined in your `.tf` file, like this:

```hcl
# Manages an elastic IP.
module "eip_publicip" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-eip/modules/eip-publicip"

  ...
}
```

Then, execute the following command to import the corresponding resource into the management of the `.tfstate` file.

```bash
$ terraform import module.eip_publicip.huaweicloud_vpc_eip.this[0] "eip_id"

module.eip_publicip.huaweicloud_vpc_eip.this[0]: Importing from ID "eip_id"...
module.eip_publicip.huaweicloud_vpc_eip.this[0]: Import complete!
  Imported huaweicloud_vpc_eip (ID: eip_id)
module.eip_publicip.huaweicloud_vpc_eip.this[0]: Refreshing state... (ID: eip_id)

Import successful!
```

### What should we do before deploy this module example

Before manage EIP resources, the access key (AK, the corresponding environment name is `HW_ACCESS_KEY`) and the secret key (SK, the corresponding environment name is `HW_SECRET_KEY`) should be configured.

For the linux VM, you can configure the corresponding environment variables with the following commands:

```bash
$ export HW_ACCESS_KEY=XXXXXXXXXXXXXXXXXXXX
$ export HW_SECRET_KEY=XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

Refer to this [document](https://support.huaweicloud.com/intl/en-us/devg-apisign/api-sign-provide-aksk.html) for AK/SK information obtain.

## Contributing

Report issues/questions/feature requests in the [issues](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-eip/issues/new)
section.

Full contributing [guidelines are covered here](../../github/how_to_contribute.md).

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

No module.

## Resources

| Name | Type |
|------|------|
| huaweicloud_vpc_eip.this | resource |
| huaweicloud_vpc_eipv3_associate.this | resource |

## Inputs

<!-- markdownlint-disable MD013 -->
| Name | Description | Type | Default | Required |
|------|-------------|------|:-------:|:--------:|
| enterprise_project_id | Used to specify whether the resource is created under the enterprise project (this parameter is only valid for enterprise users) | `string` | `""` | N |
| is_eip_create | Controls whether an elastic IP should be created | `bool` | `true` | N |
| eip_publicip_configuration | The configuration for the elastic IP | <pre>list(object({<br>  type       = optional(string, "")<br>  ip_address = optional(string, "")<br>  ip_version = optional(string, "")<br>}))</pre> | <pre>[]</pre> | Y (Unless is_eip_create is specified as false) |
| eip_bandwidth_configuration | The bandwidth configuration for the elastic IP | <pre>list(object({<br>  share_type  = string<br>  name        = optional(string, "")<br>  size        = optional(string, "")<br>  id          = optional(string, "")<br>  charge_mode = optional(string, "")<br>}))</pre> | <pre>[]</pre> | Y (Unless is_eip_create is specified as false) |
| eip_name | The name of the elastic IP | `string` | `""` | N |
| eip_tags | The key/value pairs to associate with the elastic IP | <pre>map(string)</pre> | <pre>{}</pre> | N |
| eip_charging_mode | The charging mode of the elastic IP | `string` | `""` | N |
| eip_period_unit | The charging period unit of the elastic IP | `string` | `""` | N |
| eip_period | The charging period number of the elastic IP | `string` | `""` | N |
| eip_auto_renew | Whether auto-renew function of the elastic IP is enabled | `bool` | `null` | N |
| eip_associates_configuration | The configuration of the EIP associations | <pre>list(object({<br>  publicip_id             = string<br>  associate_instance_type = string<br>  associate_instance_id   = string<br>}))</pre> | <pre>[]</pre> | N |
<!-- markdownlint-enable MD013 -->

## Outputs

| Name | Description |
|------|-------------|
| eip_id | The ID of the elastic IP |
| eip_address | The IP address of the elastic IP |
| eip_ipv6_address | The IPv6 address of the elastic IP |
| eip_private_ip | The private IP of the elastic IP |
| eip_port_id | The port ID which the elastic IP associated with |
| eip_associate_type | The associate type of the elastic IP |
| eip_associate_id | The associate ID of the elastic IP |
| eip_associate_type | The instance type to which the port belongs |
| eip_instance_id | The instance ID to which the port belongs |
