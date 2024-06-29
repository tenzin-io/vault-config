variable "mount_path" {
  type        = string
  default     = "ssh"
  description = "The mouth path of the Vault SSH CA dynamic secrets engine"
}

variable "description" {
  type    = string
  default = "The Vault SSH CA dynamic secrets engine"
}

variable "key_ttl" {
  type        = string
  default     = "43200" # 12 hours
  description = "The signed key's time-to-live"
}

variable "key_extensions" {
  type = any
  default = {
    "permit-pty"              = "",
    "permit-agent-forwarding" = "",
    "permit-port-forwarding"  = "",
    "permit-X11-forwarding"   = "",
    "permit-user-rc"          = ""
  }
  description = "The signed key's extensions"
}

variable "ssh_users" {
  type        = set(string)
  default     = []
  description = "The SSH user roles to create."
}