## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_federated_identity_credential.external_dns_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_federated_identity_credential.external_dns_public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/federated_identity_credential) | resource |
| [azurerm_role_assignment.external_dns_contributor](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.external_dns_contributor_private](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_role_assignment.rg_reader](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_user_assigned_identity.external_dns](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [helm_release.external_dns](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.application_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [azurerm_dns_zone.public](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/dns_zone) | data source |
| [azurerm_subscription.current](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/subscription) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_namespace"></a> [application\_namespace](#input\_application\_namespace) | Name of Kubernetes Namespace | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | the cluster\_name | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | the cluster\_oidc\_issuer\_url | `string` | n/a | yes |
| <a name="input_enable_public_domains"></a> [enable\_public\_domains](#input\_enable\_public\_domains) | Whether handling public domains is enabled. | `bool` | `true` | no |
| <a name="input_env"></a> [env](#input\_env) | Environment. One of "dev", "prod" or "global". | `string` | n/a | yes |
| <a name="input_kubelet_client_identity"></a> [kubelet\_client\_identity](#input\_kubelet\_client\_identity) | n/a | `string` | n/a | yes |
| <a name="input_kubelet_object_identity"></a> [kubelet\_object\_identity](#input\_kubelet\_object\_identity) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | the Azure location | `string` | n/a | yes |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | Log level of external-dns | `string` | `"debug"` | no |
| <a name="input_private_dns_zone"></a> [private\_dns\_zone](#input\_private\_dns\_zone) | Private domain Zone object used for this cluster, e.g., global.ifesw.com. | `any` | n/a | yes |
| <a name="input_private_ingress_class_name"></a> [private\_ingress\_class\_name](#input\_private\_ingress\_class\_name) | Name of the ingress class used for internal communication. | `string` | n/a | yes |
| <a name="input_public_domains"></a> [public\_domains](#input\_public\_domains) | Public domains used for this cluster. | <pre>object({<br>    azure = optional(list(string), [])<br>  })</pre> | `{}` | no |
| <a name="input_public_ingress_class_name"></a> [public\_ingress\_class\_name](#input\_public\_ingress\_class\_name) | Name of the ingress class used for internet-facing communication. | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | the resource group object | `any` | n/a | yes |
| <a name="input_subscription_id"></a> [subscription\_id](#input\_subscription\_id) | Azure subscription ID | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | Azure tenant ID | `string` | n/a | yes |

## Outputs

No outputs.
