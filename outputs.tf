output "id" {
  value       = "${join("", null_resource.default.*.triggers.id)}"
  description = "id"
}

output "name" {
  value       = "${join("", null_resource.default.*.triggers.name)}"
  description = "Name, e.g. 'api' or 'jenkins'"
}

output "environment" {
  value       = "${join("", null_resource.default.*.triggers.environment)}"
  description = "Environment, e.g. 'prod', 'uat', 'dev', or 'test'"
}

output "managedby" {
  value       = "${join("", null_resource.default.*.triggers.managedby)}"
  description = "Managedby, which could be organization name, e.g. 'DevOps Team' or 'Terraform'"
}

# Merge input tags with our tags.
# Note: `Name` has a special meaning in AWS and we need to disamgiuate it by using the computed `id`
output "tags" {
  value = "${
      merge( 
        map(
          "Name", "${join("", null_resource.default.*.triggers.id)}",
          "Environment", "${join("", null_resource.default.*.triggers.environment)}",
          "Managedby", "${join("", null_resource.default.*.triggers.managedby)}"
        )
      )
    }"

  description = "Tag map"
}
