# terraform-vcfa-supervisor-namespace

Terraform module — creates a VCFA Supervisor Namespace using the native `vcfa_supervisor_namespace` resource from the `vmware/vcfa` provider (>= 1.2). Requires an established VCFA connection (provider configured with URL, org, and API token).

As of v0.2.0 this module manages the Supervisor Namespace directly through VCFA's Terraform provider rather than applying a `SupervisorNamespace` CRD. The v0.1.0 implementation applied that CRD via the `kubernetes` provider's `kubernetes_manifest` resource against the VCFA-issued kubeconfig; that approach remains available as a fallback (pin to the `v0.1.0` tag) if a future need arises that the native resource can't express.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.14.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | >= 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_manifest.this](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_class_name"></a> [class\_name](#input\_class\_name) | Namespace class to apply to the Supervisor Namespace | `string` | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | Description for the Supervisor Namespace | `string` | `""` | no |
| <a name="input_namespace_name"></a> [namespace\_name](#input\_namespace\_name) | Name of the Supervisor Namespace to create | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Name of the VCFA project (used as the Kubernetes namespace for the manifest) | `string` | n/a | yes |
| <a name="input_region_name"></a> [region\_name](#input\_region\_name) | Region in which to create the Supervisor Namespace | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_namespace_name"></a> [namespace\_name](#output\_namespace\_name) | Name of the created Supervisor Namespace |
| <a name="output_phase"></a> [phase](#output\_phase) | Current phase reported on the SupervisorNamespace status, if the API has populated it |
| <a name="output_supervisor_namespace"></a> [supervisor\_namespace](#output\_supervisor\_namespace) | Created SupervisorNamespace manifest |
| <a name="output_uid"></a> [uid](#output\_uid) | Kubernetes UID of the created SupervisorNamespace resource |
<!-- END_TF_DOCS -->
