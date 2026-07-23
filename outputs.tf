output "id" {
  description = "ID of the created Supervisor Namespace"
  value       = vcfa_supervisor_namespace.this.id
}

output "name" {
  description = "Generated name of the created Supervisor Namespace"
  value       = vcfa_supervisor_namespace.this.name
}

output "phase" {
  description = "Current phase reported on the Supervisor Namespace"
  value       = vcfa_supervisor_namespace.this.phase
}

output "ready" {
  description = "Whether the Supervisor Namespace is in a ready status"
  value       = vcfa_supervisor_namespace.this.ready
}
