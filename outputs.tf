output "supervisor_namespace" {
  description = "Created SupervisorNamespace manifest"
  value       = kubernetes_manifest.this.manifest
}

output "namespace_name" {
  description = "Name of the created Supervisor Namespace"
  value       = var.namespace_name
}

output "phase" {
  description = "Current phase reported on the SupervisorNamespace status, if the API has populated it"
  value       = try(kubernetes_manifest.this.object.status.phase, null)
}

output "uid" {
  description = "Kubernetes UID of the created SupervisorNamespace resource"
  value       = try(kubernetes_manifest.this.object.metadata.uid, null)
}
