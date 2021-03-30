data "aws_iam_policy_document" "default" {
  override_policy_documents = var.source_documents
}
