variable "mount_path" {
  type    = string
  default = "userpass"
}

variable "description" {
  type    = string
  default = "The userpass authentication method"
}

variable "token_ttl" {
  type        = string
  default     = "768h"
  description = "The lifetime of the token"
}

variable "vault_policies" {
  type = map(list(object({
    path         = string
    capabilities = optional(set(string), ["read"])
    description  = optional(string, null)
  })))
  default     = {}
  description = "Named policies to create inside this module, referenced by vault_allowed_users. Merges with built-in defaults (reader, editor, admin); user-supplied values take precedence on duplicate keys."
}

variable "vault_allowed_users" {
  type        = map(list(string))
  description = "Map of username to list of policy names. An empty list means no policies are applied."
}

variable "vault_secrets_mount_path" {
  type        = string
  description = "The mount path of the KV secrets engine where generated user credentials are stored."
  default     = ""
}

variable "vault_userpass_secrets_path_prefix" {
  type        = string
  description = "Path prefix within the KV mount under which generated userpass credentials are stored."
  default     = "vault-users"
}
