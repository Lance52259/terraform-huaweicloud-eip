# The Terraform module of HUAWEI Cloud EIP service

What capabilities does the current module provide:

+ Flexible EIP resource combination (through multiple EIP sub-modules)
+ Abundant example references, one-click deployment of EIP resources.

## Notes

If you want to manage EIP resources using Terraform module (via this repository), you need to make the following
declaration in the `source` of the script.

```hcl
# Use the latest version.
module "eip_ipv4_publicip" {
  source = "github.com/terraform-huaweicloud-modules/terraform-huaweicloud-eip/modules/eip-publicip"

  ...
}
```

## Contributing

Report issues/questions/feature requests in the [issues](https://github.com/terraform-huaweicloud-modules/terraform-huaweicloud-eip/issues/new)
section.

Full contributing [guidelines are covered here](.github/how_to_contribute.md).

## Requirements

| Name | Version |
|------|---------|
| Terraform | >= 1.3.0 |
| Huaweicloud Provider | >= 1.73.0 |

## Modules

No module.

## Resources

No resource.

## Inputs

No input.

## Outputs

No output.
