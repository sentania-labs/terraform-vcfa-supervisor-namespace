variable "namespace_name" {
  type        = string
  description = "Name of the Supervisor Namespace to create"

  validation {
    condition     = can(regex("^[a-z0-9][a-z0-9-]*[a-z0-9]$", var.namespace_name))
    error_message = "namespace_name must be lowercase alphanumeric with hyphens, and cannot start or end with a hyphen."
  }
}

variable "project_name" {
  type        = string
  description = "Name of the VCFA project (used as the Kubernetes namespace for the manifest)"
}

variable "description" {
  type        = string
  description = "Description for the Supervisor Namespace"
  default     = ""
}

variable "region_name" {
  type        = string
  description = "Region in which to create the Supervisor Namespace"
}

variable "class_name" {
  type        = string
  description = "Namespace class to apply to the Supervisor Namespace"
}
