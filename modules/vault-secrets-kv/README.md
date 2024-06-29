# README
A Terraform module to setup Vault KV v2 secrets engine.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [vault_kv_secret_backend_v2.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_backend_v2) | resource |
| [vault_mount.secrets](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"The Vault KV version 2 secrets engine"` | no |
| <a name="input_max_versions"></a> [max\_versions](#input\_max\_versions) | The number of secret versions to keep | `number` | `20` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | The mount path of the KV version 2 secrets engine | `string` | `"secrets"` | no |
<!-- END_TF_DOCS -->