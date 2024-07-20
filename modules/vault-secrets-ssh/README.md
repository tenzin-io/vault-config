<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_vault"></a> [vault](#requirement\_vault) | ~> 4.0 |

## Resources

| Name | Type |
|------|------|
| [vault_mount.ssh](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/mount) | resource |
| [vault_ssh_secret_backend_ca.ssh](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ssh_secret_backend_ca) | resource |
| [vault_ssh_secret_backend_role.ssh_user](https://registry.terraform.io/providers/hashicorp/vault/latest/docs/resources/ssh_secret_backend_role) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | `"The SSH CA dynamic secrets engine"` | no |
| <a name="input_key_extensions"></a> [key\_extensions](#input\_key\_extensions) | The signed key's extensions | `any` | <pre>{<br>  "permit-X11-forwarding": "",<br>  "permit-agent-forwarding": "",<br>  "permit-port-forwarding": "",<br>  "permit-pty": "",<br>  "permit-user-rc": ""<br>}</pre> | no |
| <a name="input_key_ttl"></a> [key\_ttl](#input\_key\_ttl) | The signed key's time-to-live | `string` | `"43200"` | no |
| <a name="input_mount_path"></a> [mount\_path](#input\_mount\_path) | The mouth path of the Vault SSH CA dynamic secrets engine | `string` | `"ssh"` | no |
| <a name="input_ssh_users"></a> [ssh\_users](#input\_ssh\_users) | The SSH user roles to create. | `set(string)` | `[]` | no |
<!-- END_TF_DOCS -->