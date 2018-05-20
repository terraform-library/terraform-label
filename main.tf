resource "null_resource" "default" {
  count = "${var.enabled == "true" ? 1 : 0}"

  triggers = {
    id          = "${lower(join(var.delimiter, compact(concat(list(var.name, var.environment, var.managedby) ))))}"
    name        = "${lower(format("%v", var.name))}"
    environment = "${lower(format("%v", var.environment))}"
    managedby   = "${lower(format("%v", var.managedby))}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
