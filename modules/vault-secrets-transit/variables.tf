variable "mount_path" {
  type        = string
  default     = "transit"
  description = "The mount path of the transit secrets engine"
}

variable "description" {
  type    = string
  default = "The Vault transit secrets engine"
}
