provider "vcfa" {
  url                  = var.vcfa_url
  org                  = var.vcfa_organization
  api_token            = var.vcfa_refresh_token
  allow_unverified_ssl = var.insecure
  auth_type            = "api_token"
}

module "supervisor_namespace" {
  source = "../"

  name_prefix     = var.name_prefix
  project_name    = var.project_name
  description     = var.description
  region_name     = var.region_name
  vpc_name        = var.vpc_name
  class_name      = var.class_name
  storage_classes = var.storage_classes
  vm_classes      = var.vm_classes
  zones           = var.zones
}
