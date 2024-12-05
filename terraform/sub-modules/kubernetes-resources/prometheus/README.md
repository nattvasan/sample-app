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
| [azurerm_key_vault_key.thanos_data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_key) | resource |
| [azurerm_role_assignment.role_keyaccess](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/role_assignment) | resource |
| [azurerm_storage_account.thanos_data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account) | resource |
| [azurerm_storage_container.thanos_data](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_container) | resource |
| [azurerm_user_assigned_identity.identity](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/user_assigned_identity) | resource |
| [helm_release.prometheus](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [helm_release.thanos](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |
| [kubernetes_namespace.application_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_secret.thanos_objstore_secret](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/secret) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_application_namespace"></a> [application\_namespace](#input\_application\_namespace) | Name of Kubernetes Namespace | `string` | `"prometheus"` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | the cluster\_name | `string` | n/a | yes |
| <a name="input_cluster_oidc_issuer_url"></a> [cluster\_oidc\_issuer\_url](#input\_cluster\_oidc\_issuer\_url) | the cluster\_oidc\_issuer\_url | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | Primary domain for DNS entries | `string` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | Environment. One of "dev", "prod" or "global". | `string` | n/a | yes |
| <a name="input_ingress_class"></a> [ingress\_class](#input\_ingress\_class) | Name of the ingress class to use | `string` | `"internal"` | no |
| <a name="input_key_vault"></a> [key\_vault](#input\_key\_vault) | Azure Key Vault object | `any` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | n/a | yes |
| <a name="input_metrics_auth_password"></a> [metrics\_auth\_password](#input\_metrics\_auth\_password) | Password of the user for prometheus metrics | `string` | n/a | yes |
| <a name="input_metrics_auth_username"></a> [metrics\_auth\_username](#input\_metrics\_auth\_username) | Name of the user for prometheus metrics | `string` | n/a | yes |
| <a name="input_resource_group"></a> [resource\_group](#input\_resource\_group) | the resource group object | `any` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | <pre>{<br>  "Created_by": "DevOps-Admins-Terragrunted"<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | Status of the chart deployment |
