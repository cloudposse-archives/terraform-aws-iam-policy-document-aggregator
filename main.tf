data "utils_deep_merge_json" "default" {
  input = var.source_documents
}

data "aws_iam_policy_document" "empty" {
}

data "aws_iam_policy_document" "default" {
  source_json   = data.aws_iam_policy_document.empty.json
  override_json = jsondecode(data.utils_deep_merge_json.default.output)
}
