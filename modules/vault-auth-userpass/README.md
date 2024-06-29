# README
A Terraform module to setup Vault userpass authentication engine.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"Vault userpass authentication engine"` | no |
| <a name="input_vault_admin_password"></a> [vault\_admin\_password](#input\_vault\_admin\_password) | n/a | `string` | n/a | yes |
| <a name="input_vault_admin_policies"></a> [vault\_admin\_policies](#input\_vault\_admin\_policies) | n/a | `set(string)` | n/a | yes |
| <a name="input_vault_admin_username"></a> [vault\_admin\_username](#input\_vault\_admin\_username) | n/a | `string` | `"admin"` | no |
<!-- END_TF_DOCS -->