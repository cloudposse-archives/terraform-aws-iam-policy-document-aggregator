data "utils_deep_merge_json" "default" {
  input = [
    for document in var.source_documents : jsonencode(document)
  ]
}

data "aws_iam_policy_document" "empty" {
}

data "aws_iam_policy_document" "default" {
  source_json   = data.aws_iam_policy_document.empty.json
  override_json = data.utils_deep_merge_json.default.output
}
