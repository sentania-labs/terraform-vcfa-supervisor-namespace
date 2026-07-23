resource "vcfa_supervisor_namespace" "this" {
  name_prefix  = var.name_prefix
  project_name = var.project_name
  region_name  = var.region_name
  vpc_name     = var.vpc_name
  class_name   = var.class_name
  description  = var.description

  dynamic "storage_classes_class_config_overrides" {
    for_each = var.storage_classes
    content {
      name  = storage_classes_class_config_overrides.key
      limit = storage_classes_class_config_overrides.value.limit
    }
  }

  dynamic "vm_classes_class_config_overrides" {
    for_each = toset(var.vm_classes)
    content {
      name = vm_classes_class_config_overrides.value
    }
  }

  dynamic "zones_class_config_overrides" {
    for_each = { for zone in var.zones : zone.name => zone }
    content {
      name               = zones_class_config_overrides.value.name
      cpu_limit          = zones_class_config_overrides.value.cpu_limit
      cpu_reservation    = zones_class_config_overrides.value.cpu_reservation
      memory_limit       = zones_class_config_overrides.value.memory_limit
      memory_reservation = zones_class_config_overrides.value.memory_reservation
    }
  }
}
