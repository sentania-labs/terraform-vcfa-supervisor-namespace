variable "namespace_name" {
  type        = string
  description = "Name of the Supervisor Namespace to create"
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

variable "class_name" {
  type        = string
  description = "Namespace class to apply"
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
