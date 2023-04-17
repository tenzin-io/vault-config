# README

<!-- BEGIN_TF_DOCS -->


## Providers

| Name | Version |
|------|---------|
| <a name="provider_vault"></a> [vault](#provider\_vault) | n/a |

## Resources

| Name | Type |
|------|------|
| [vault_kv_secret_backend_v2.kv](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/kv_secret_backend_v2) | resource |
| [vault_mount.kv](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_secrets_engine_path"></a> [secrets\_engine\_path](#input\_secrets\_engine\_path) | The path of the secret engine in Vault | `string` | `"secret"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_secrets_engine_mount_path"></a> [secrets\_engine\_mount\_path](#output\_secrets\_engine\_mount\_path) | The path of the mounted secrets engine |
<!-- END_TF_DOCS -->