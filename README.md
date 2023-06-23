# README
A Terraform configuration repository to manage my Vault server.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.17.0 |

## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_jwt_auth_backend.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.github_actions](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_kv_secret_backend_v2.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_backend_v2) | resource |
| [vault_mount.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_repo_to_secret_paths"></a> [github\_repo\_to\_secret\_paths](#input\_github\_repo\_to\_secret\_paths) | A map of GitHub repo to allowed secret paths | `map(list(string))` | `{}` | no |
| <a name="input_github_secret_mount_path"></a> [github\_secret\_mount\_path](#input\_github\_secret\_mount\_path) | The secret store mount path | `string` | `"github"` | no |
| <a name="input_vault_admin_password"></a> [vault\_admin\_password](#input\_vault\_admin\_password) | The Vault admin password. | `string` | n/a | yes |
<!-- END_TF_DOCS -->