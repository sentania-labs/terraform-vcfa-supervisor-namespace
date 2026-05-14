resource "kubernetes_manifest" "this" {
  manifest = {
    "apiVersion" = "infrastructure.cci.vmware.com/v1alpha1"
    "kind"       = "SupervisorNamespace"
    "metadata" = {
      "name"      = var.namespace_name
      "namespace" = var.project_name
    }
    "spec" = {
      "description" = var.description
      "regionName"  = var.region_name
      "className"   = var.class_name
    }
  }
}
