output "result" {
  value       = "${module.aggregated_policy.result_document}"
  description = "Aggregated policy document"
}
