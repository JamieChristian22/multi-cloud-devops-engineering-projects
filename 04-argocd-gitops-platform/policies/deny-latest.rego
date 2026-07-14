package kubernetes.admission

deny[msg] {
  c := input.spec.template.spec.containers[_]
  endswith(c.image, ":latest")
  msg := sprintf("mutable latest tag forbidden: %s", [c.image])
}
