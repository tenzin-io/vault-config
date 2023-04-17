# README
A Terraform configuration repository to manage my Vault server.

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | 3.14.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_auth_jwt_github"></a> [auth\_jwt\_github](#module\_auth\_jwt\_github) | ./modules/auth-jwt-github | n/a |
| <a name="module_secrets_kv"></a> [secrets\_kv](#module\_secrets\_kv) | ./modules/secrets-kv | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_auth_backend.userpass](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/auth_backend) | resource |
| [vault_generic_endpoint.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/generic_endpoint) | resource |
| [vault_policy.read_secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy.vault_admin](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_admin_password"></a> [admin\_password](#input\_admin\_password) | The Vault admin password | `string` | n/a | yes |
<!-- END_TF_DOCS -->