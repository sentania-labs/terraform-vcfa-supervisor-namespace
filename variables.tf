variable "name_prefix" {
  type        = string
  description = "Prefix used by VCFA to generate the Supervisor Namespace name"

  validation {
    condition     = can(regex("^[a-z0-9]([a-z0-9-]*[a-z0-9])?$", var.name_prefix))
    error_message = "name_prefix must be lowercase alphanumeric with hyphens, and cannot start or end with a hyphen."
  }
}

variable "project_name" {
  type        = string
  description = "Name of the VCFA project the Supervisor Namespace belongs to"
}

variable "region_name" {
  type        = string
  description = "Name of the Region in which to create the Supervisor Namespace"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC the Supervisor Namespace attaches to"
}

variable "class_name" {
  type        = string
  description = "Name of the Supervisor Namespace Class to apply"
}

variable "description" {
  type        = string
  description = "Description for the Supervisor Namespace"
  default     = ""
}

variable "storage_classes" {
  type = map(object({
    limit = string
  }))
  description = "Storage Class overrides, keyed by Storage Class name. limit format: <number><unit>, where <unit> is Mi, Gi, or Ti"
  default     = {}
}

variable "vm_classes" {
  type        = list(string)
  description = "Names of VM Classes to grant to the Supervisor Namespace"
  default     = []
}

variable "zones" {
  type = list(object({
    name               = string
    cpu_limit          = string
    cpu_reservation    = string
    memory_limit       = string
    memory_reservation = string
  }))
  description = "Zone overrides for the Supervisor Namespace. cpu_limit/cpu_reservation format: <number><unit> (M or G); memory_limit/memory_reservation format: <number><unit> (Mi, Gi, or Ti)"
  default     = []
}
