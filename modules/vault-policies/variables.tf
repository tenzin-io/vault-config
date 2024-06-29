variable "vault_policies" {
  type = map(list(object({
    path         = string
    capabilities = optional(set(string), ["read"])
    description  = optional(string, null)
  })))
  description = "A map of Vault policies and their associated rules"
}