# vault-config

A Terraform configuration repository managing the Vault instance at <https://vault.tenzin.io>.

## Modules

| Module | Description |
|--------|-------------|
| [vault-auth-userpass](modules/vault-auth-userpass/) | Userpass authentication engine with built-in policies and auto-generated credentials |
| [vault-secrets-kv](modules/vault-secrets-kv/) | KV v2 secrets engine |
| [vault-secrets-transit](modules/vault-secrets-transit/) | Transit secrets engine with composable policy rules output |

## Architecture

Policies are managed inside `vault-auth-userpass`. Other modules (e.g. `vault-secrets-transit`) output `policy_rules` that can be passed directly into the userpass module's `vault_policies` variable, keeping policy management centralised without tight coupling between modules.

## Requirements

- Terraform `~> 1.9`
- Vault provider `~> 5.0`
- AWS credentials with access to the S3 backend bucket `tenzin-io`
