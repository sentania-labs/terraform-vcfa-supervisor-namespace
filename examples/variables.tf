variable "name_prefix" {
  type        = string
  description = "Prefix used by VCFA to generate the Supervisor Namespace name"
}

variable "project_name" {
  type        = string
  description = "Name of the VCFA project"
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

variable "vpc_name" {
  type        = string
  description = "Name of the VPC the Supervisor Namespace attaches to"
}

variable "class_name" {
  type        = string
  description = "Namespace class to apply"
}

variable "storage_classes" {
  type = map(object({
    limit = string
  }))
  description = "Storage Class overrides, keyed by Storage Class name"
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
  description = "Zone overrides for the Supervisor Namespace"
  default     = []
}

########################################
# General VCF-A Configuration
########################################

/**
 * vcfa_url
 * URL of the VCF-A (Aria Automation) endpoint.
 */
variable "vcfa_url" {
  type = string
}

variable "vcfa_organization" {
  type        = string
  description = "The VCFA Organization"
}

/**
 * vcfa_refresh_token
 * Refresh token used for authentication to the VCF-A API.
 * Marked sensitive to avoid logging/output exposure.
 */
variable "vcfa_refresh_token" {
  type      = string
  sensitive = true
}

/**
 * insecure
 * Whether to skip SSL certificate verification when connecting
 * to the VCF-A API (typically true for lab environments).
 */
variable "insecure" {
  type    = bool
  default = true
}
