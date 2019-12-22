provider "aws" {
  region = var.region

  # Make it faster by skipping the checks
  skip_get_ec2_platforms      = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
  skip_credentials_validation = true
  skip_requesting_account_id  = true
}

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
      "s3:AbortMultipartUpload"
    ]
  }
}

data "aws_iam_policy_document" "base" {
  statement {
    sid       = "BaseAccess"
    effect    = "Allow"
    resources = ["*"]

    actions = [
      "s3:ListBucket",
      "s3:ListBucketVersions"
    ]
  }
}

module "aggregated_policy" {
  source = "../../"

  source_documents = [
    data.aws_iam_policy_document.base.json,
    data.aws_iam_policy_document.resource_full_access.json
  ]
}
