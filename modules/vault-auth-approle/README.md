# README
A Terraform module to setup the AppRole authentication method in a Vault instance.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [vault_approle_auth_backend_login.login](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_login) | resource |
| [vault_approle_auth_backend_role.app](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/approle_auth_backend_role) | resource |
| [vault_auth_backend.approle](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_apps"></a> [allowed\_apps](#input\_allowed\_apps) | A map of allowed apps that can login to Vault | <pre>map(object({<br>    bound_cidrs = optional(list(string), [])<br>    policies    = set(string)<br>  }))</pre> | n/a | yes |
| <a name="input_description"></a> [description](#input\_description) | The description of the authentication method | `string` | `"The AppRole authentication method"` | no |
| <a name="input_global_bound_cidrs"></a> [global\_bound\_cidrs](#input\_global\_bound\_cidrs) | The bound\_cidrs at parent scope | `list(string)` | `[]` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | The path to mount the authentication method | `string` | `"approle"` | no |
<!-- END_TF_DOCS -->