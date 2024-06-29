# README
A Terraform module to setup GitHub specific Vault JWT authentication engine. 

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [vault_jwt_auth_backend.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.github_repo](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_github_repos"></a> [allowed\_github\_repos](#input\_allowed\_github\_repos) | A map of GitHub repos and their associated Vault policies | `map(list(string))` | n/a | yes |
| <a name="input_bound_issuer"></a> [bound\_issuer](#input\_bound\_issuer) | The OIDC bound issuer URL | `string` | `"https://token.actions.githubusercontent.com"` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"The Vault JWT authentication engine for GitHub"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | n/a | `string` | `"jwt"` | no |
| <a name="input_oidc_discovery_url"></a> [oidc\_discovery\_url](#input\_oidc\_discovery\_url) | The OIDC discovery URL | `string` | `"https://token.actions.githubusercontent.com"` | no |
<!-- END_TF_DOCS -->