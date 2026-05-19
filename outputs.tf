output "supervisor_namespace" {
  description = "Created SupervisorNamespace manifest"
  value       = kubernetes_manifest.this.manifest
}
