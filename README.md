# README
A Terraform configuration repository to manage my Vault server.

<!-- BEGIN_TF_DOCS -->


## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_jwt_auth_backend.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.github_repo](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |
| [vault_kv_secret_backend_v2.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_backend_v2) | resource |
| [vault_mount.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_mount.ssh](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_policy.default_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.github_repo_to_secret](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.github_repo_to_ssh_user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_ssh_secret_backend_ca.ssh](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ssh_secret_backend_ca) | resource |
| [vault_ssh_secret_backend_role.ssh_user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ssh_secret_backend_role) | resource |
| [vault_policy_document.default_policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |
| [vault_policy_document.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_github_repos"></a> [github\_repos](#input\_github\_repos) | A map of GitHub repo to its allowed secret paths under the github secret store | <pre>map(object({<br>    secrets   = optional(list(string), [])<br>    ssh_users = optional(list(string), [])<br>  }))</pre> | `{}` | no |
| <a name="input_vault_admin_password"></a> [vault\_admin\_password](#input\_vault\_admin\_password) | The password to configure for Vault admin user | `string` | n/a | yes |
<!-- END_TF_DOCS -->