provider "vcfa" {
  url                  = var.vcfa_url
  org                  = var.vcfa_organization
  api_token            = var.vcfa_refresh_token
  allow_unverified_ssl = var.insecure
  auth_type            = "api_token"
}

data "vcfa_kubeconfig" "kubeconfig" {}

provider "kubernetes" {
  host     = data.vcfa_kubeconfig.kubeconfig.host
  insecure = data.vcfa_kubeconfig.kubeconfig.insecure_skip_tls_verify
  token    = data.vcfa_kubeconfig.kubeconfig.token
}

module "supervisor_namespace" {
  source = "../"

  namespace_name = var.namespace_name
  project_name   = var.project_name
  description    = var.description
  region_name    = var.region_name
  class_name     = var.class_name
}
