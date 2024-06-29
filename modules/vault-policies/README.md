# README
A Terraform module that will help manage Vault policies.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [vault_policy.policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/policy) | resource |
| [vault_policy_document.policy](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/data-sources/policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vault_policies"></a> [vault\_policies](#input\_vault\_policies) | A map of Vault policies and their associated rules | <pre>map(list(object({<br>    path         = string<br>    capabilities = set(string)<br>    description  = optional(string, null)<br>  })))</pre> | n/a | yes |
<!-- END_TF_DOCS -->