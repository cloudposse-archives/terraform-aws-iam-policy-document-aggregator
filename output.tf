output "result_document" {
  value       = "${data.aws_iam_policy_document.default.json}"
  description = "Aggregeted IAM policy"
}
