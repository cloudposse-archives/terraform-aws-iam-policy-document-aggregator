locals {
  ## Workaround to solve this problem https://github.com/hashicorp/terraform/issues/11210
  source_documents = ["${concat(list("null"), var.source_documents)}"]

  policies = [
    "${length(local.source_documents) > 1 ? element(local.source_documents, 1) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 2 ? element(local.source_documents, 2) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 3 ? element(local.source_documents, 3) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 4 ? element(local.source_documents, 4) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 5 ? element(local.source_documents, 5) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 6 ? element(local.source_documents, 6) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 7 ? element(local.source_documents, 7) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 8 ? element(local.source_documents, 8) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 9 ? element(local.source_documents, 9) : data.aws_iam_policy_document.empty.json}",
    "${length(local.source_documents) > 10 ? element(local.source_documents, 10) : data.aws_iam_policy_document.empty.json}",
  ]
}

data "aws_iam_policy_document" "empty" {}

data "aws_iam_policy_document" "zero" {
  source_json   = "${data.aws_iam_policy_document.empty.json}"
  override_json = "${element(local.policies, 0)}"
  "statement"   = []
}

data "aws_iam_policy_document" "one" {
  source_json   = "${data.aws_iam_policy_document.zero.json}"
  override_json = "${element(local.policies, 1)}"
  "statement"   = []
}

data "aws_iam_policy_document" "two" {
  source_json   = "${data.aws_iam_policy_document.one.json}"
  override_json = "${element(local.policies, 2)}"
  "statement"   = []
}

data "aws_iam_policy_document" "three" {
  source_json   = "${data.aws_iam_policy_document.two.json}"
  override_json = "${element(local.policies, 3)}"
  "statement"   = []
}

data "aws_iam_policy_document" "four" {
  source_json   = "${data.aws_iam_policy_document.three.json}"
  override_json = "${element(local.policies, 4)}"
  "statement"   = []
}

data "aws_iam_policy_document" "five" {
  source_json   = "${data.aws_iam_policy_document.four.json}"
  override_json = "${element(local.policies, 5)}"
  "statement"   = []
}

data "aws_iam_policy_document" "six" {
  source_json   = "${data.aws_iam_policy_document.five.json}"
  override_json = "${element(local.policies, 6)}"
  "statement"   = []
}

data "aws_iam_policy_document" "seven" {
  source_json   = "${data.aws_iam_policy_document.six.json}"
  override_json = "${element(local.policies, 7)}"
  "statement"   = []
}

data "aws_iam_policy_document" "eight" {
  source_json   = "${data.aws_iam_policy_document.seven.json}"
  override_json = "${element(local.policies, 8)}"
  "statement"   = []
}

data "aws_iam_policy_document" "nine" {
  source_json   = "${data.aws_iam_policy_document.eight.json}"
  override_json = "${element(local.policies, 9)}"
  "statement"   = []
}

data "aws_iam_policy_document" "default" {
  source_json = "${data.aws_iam_policy_document.nine.json}"
  "statement" = []
}
