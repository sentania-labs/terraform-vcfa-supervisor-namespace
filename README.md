# terraform-vcfa-supervisor-namespace

Terraform module — creates a VCFA Supervisor Namespace using the native `vcfa_supervisor_namespace` resource from the `vmware/vcfa` provider (>= 1.2). Requires an established VCFA connection (provider configured with URL, org, and API token).

As of v0.2.0 this module manages the Supervisor Namespace directly through VCFA's Terraform provider rather than applying a `SupervisorNamespace` CRD. The v0.1.0 implementation applied that CRD via the `kubernetes` provider's `kubernetes_manifest` resource against the VCFA-issued kubeconfig; that approach remains available as a fallback (pin to the `v0.1.0` tag) if a future need arises that the native resource can't express.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_vcfa"></a> [vcfa](#requirement\_vcfa) | >= 1.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_vcfa"></a> [vcfa](#provider\_vcfa) | >= 1.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vcfa_supervisor_namespace.this](https://registry.terraform.io/providers/vmware/vcfa/latest/docs/resources/supervisor_namespace) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_class_name"></a> [class\_name](#input\_class\_name) | Name of the Supervisor Namespace Class to apply | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the Supervisor Namespace | `string` | `""` | no |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | Prefix used by VCFA to generate the Supervisor Namespace name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the VCFA project the Supervisor Namespace belongs to | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Name of the Region in which to create the Supervisor Namespace | `string` | n/a | yes |
| <a name="input_storage_classes"></a> [storage\_classes](#input\_storage\_classes) | Storage Class overrides, keyed by Storage Class name. limit format: <number><unit>, where <unit> is Mi, Gi, or Ti | <pre>map(object({<br/>    limit = string<br/>  }))</pre> | `{}` | no |
| <a name="input_vm_classes"></a> [vm\_classes](#input\_vm\_classes) | Names of VM Classes to grant to the Supervisor Namespace | `list(string)` | `[]` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC the Supervisor Namespace attaches to | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | Zone overrides for the Supervisor Namespace. cpu\_limit/cpu\_reservation format: <number><unit> (M or G); memory\_limit/memory\_reservation format: <number><unit> (Mi, Gi, or Ti) | <pre>list(object({<br/>    name               = string<br/>    cpu_limit          = string<br/>    cpu_reservation    = string<br/>    memory_limit       = string<br/>    memory_reservation = string<br/>  }))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | ID of the created Supervisor Namespace |
| <a name="output_name"></a> [name](#output\_name) | Generated name of the created Supervisor Namespace |
| <a name="output_phase"></a> [phase](#output\_phase) | Current phase reported on the Supervisor Namespace |
| <a name="output_ready"></a> [ready](#output\_ready) | Whether the Supervisor Namespace is in a ready status |
<!-- END_TF_DOCS -->
