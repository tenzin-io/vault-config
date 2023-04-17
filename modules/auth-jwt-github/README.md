# README

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_jwt_auth_backend.github](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend) | resource |
| [vault_jwt_auth_backend_role.actions_runner](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/jwt_auth_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_allowed_github_repos"></a> [allowed\_github\_repos](#input\_allowed\_github\_repos) | A list of allowed GitHub repos via the JWT auth method. | <pre>map(object({<br>    claim = string<br>    token_policies = list(string)<br>  }))</pre> | `{}` | no |
| <a name="input_auth_method_path"></a> [auth\_method\_path](#input\_auth\_method\_path) | n/a | `string` | `"jwt"` | no |
| <a name="input_github_actions_bound_issuer"></a> [github\_actions\_bound\_issuer](#input\_github\_actions\_bound\_issuer) | n/a | `string` | `"https://token.actions.githubusercontent.com"` | no |
| <a name="input_github_actions_oidc_discovery_url"></a> [github\_actions\_oidc\_discovery\_url](#input\_github\_actions\_oidc\_discovery\_url) | n/a | `string` | `"https://token.actions.githubusercontent.com"` | no |
<!-- END_TF_DOCS -->