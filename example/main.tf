data "aws_iam_policy_document" "resource_full_access" {
  statement {
    sid       = "FullAccess"
    effect    = "Allow"
    resources = ["arn:aws:s3:::bucketname/path/*"]

    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:GetObject",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:ListBucketMultipartUploads",
      "s3:GetBucketLocation",
      "s3:AbortMultipartUpload",
    ]
  }
}

data "aws_iam_policy_document" "base" {
  statement {
    sid = "BaseAccess"

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions",
    ]

    resources = ["*"]
    effect    = "Allow"
  }
}


module "aggregated_policy" {
  source = "../"
  source_documents = [
    "${data.aws_iam_policy_document.base.json}",
    "${data.aws_iam_policy_document.resource_full_access.json}"
  ]
}

resource "aws_iam_role" "default" {
  name                 = "example-role"
  description          = "IAM Role with permissions to perform actions on S3 resources"
}

resource "aws_iam_role_policy" "default" {
  name        = "example-policy"
  description = "Allow S3 actions"
  role = "${aws_iam_role.default.id}"
  policy      = "${module.aggregated_policy.result_document}"
}

