# vault-auth-userpass

A Terraform module that configures a Vault userpass authentication engine, manages policies, and stores auto-generated user credentials in a KV v2 secrets engine.

## Features

- Enables the userpass auth backend at a configurable mount path
- Ships with built-in `reader`, `editor`, and `admin` policies scoped to the KV secrets mount
- Accepts caller-defined policies that extend or override the built-in defaults
- Generates random passwords for all users and stores credentials in KV with metadata indicating they are Terraform-managed
- Empty policy list for a user means no policies are applied at login

## Built-in policies

| Policy | Capabilities |
|--------|-------------|
| `reader` | `read`, `list` on `<mount>/data/*` and `<mount>/metadata/*` |
| `editor` | `create`, `read`, `update`, `delete`, `list` on `<mount>/data/*`; `read`, `list` on `<mount>/metadata/*` |
| `admin`  | `create`, `read`, `update`, `delete`, `list`, `sudo` on `*` |

## Example usage

### Minimal — built-in policies only

```hcl
module "vault_auth_userpass" {
  source = "./modules/vault-auth-userpass"

  vault_allowed_users = {
    "admin"      = ["admin"]
    "tenzin-bot" = ["reader"]
  }

  vault_secrets_mount_path = module.vault_secrets_kv.mount_path
}
```

### With custom policies

```hcl
module "vault_auth_userpass" {
  source = "./modules/vault-auth-userpass"

  vault_policies = {
    # override built-in reader to add an extra shared path
    "reader" = [
      { path = "secrets/data/*",        capabilities = ["read", "list"] },
      { path = "secrets/metadata/*",    capabilities = ["read", "list"] },
      { path = "secrets/data/shared/*", capabilities = ["read", "list"] },
    ]
    # custom policy not in the built-in set
    "ci-runner" = [
      { path = "secrets/data/ci/*", capabilities = ["read"] },
    ]
  }

  vault_allowed_users = {
    "admin"     = ["admin"]
    "ci-bot"    = ["ci-runner"]
    "developer" = ["editor"]
  }

  vault_secrets_mount_path           = module.vault_secrets_kv.mount_path
  vault_userpass_secrets_path_prefix = "userpass-creds"
}
```

## Variables

| Name | Description | Default |
|------|-------------|---------|
| `mount_path` | Mount path for the userpass auth backend | `"userpass"` |
| `description` | Description of the auth backend | `"The userpass authentication method"` |
| `token_ttl` | Default and max lease TTL for tokens | `"768h"` |
| `vault_policies` | Caller-defined policies; merged over built-in defaults (caller wins on duplicate keys) | `{}` |
| `vault_allowed_users` | Map of username to list of policy names | required |
| `vault_secrets_mount_path` | KV mount path where generated credentials are stored; leave empty to skip credential storage | `""` |
| `vault_userpass_secrets_path_prefix` | Path prefix within the KV mount for stored credentials | `"vault-users"` |

## Notes

- Generated passwords are 32 characters, alphanumeric. Rotating them requires a `terraform apply` — the new password is written to both the userpass account and the KV secret atomically.
- Vault's built-in `default` policy (token self-lookup, renewal, revocation) is attached automatically by Vault at login time and does not need to be listed explicitly.
