# vault-secrets-transit

A Terraform module that enables the Vault transit secrets engine and outputs policy rules for consuming it.

## Features

- Mounts the transit secrets engine at a configurable path
- Outputs `policy_rules` shaped to plug directly into the `vault-auth-userpass` module's `vault_policies` variable, so no separate policy management is needed

## Example usage

```hcl
module "vault_secrets_transit" {
  source = "./modules/vault-secrets-transit"
}

module "vault_auth_userpass" {
  source = "./modules/vault-auth-userpass"
  vault_policies = {
    "transit" = module.vault_secrets_transit.policy_rules
  }
  vault_allowed_users = {
    "admin" = ["admin", "transit"]
  }
  vault_secrets_mount_path = module.vault_secrets_kv.mount_path
}
```

## Policy rules output

The `policy_rules` output grants the following capabilities on the transit mount:

| Path | Capabilities |
|------|-------------|
| `<mount>/encrypt/*` | `update` |
| `<mount>/decrypt/*` | `update` |
| `<mount>/rewrap/*`  | `update` |
| `<mount>/keys/*`    | `read`, `list` |

## Variables

| Name | Description | Default |
|------|-------------|---------|
| `mount_path` | Mount path for the transit secrets engine | `"transit"` |
| `description` | Description of the secrets engine | `"The Vault transit secrets engine"` |

## Outputs

| Name | Description |
|------|-------------|
| `mount_path` | The mount path of the transit secrets engine |
| `policy_rules` | Policy rules for encrypt, decrypt, rewrap, and key-read access |
