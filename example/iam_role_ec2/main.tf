module "iam_assume_role" {
  source                        = "../../"
  role_name                     = "ec2-container-instance-profile"
  policy_arns_count             = "2"
  policy_arns                   = ["${aws_iam_policy.custom_policy.arn}", "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"]
  create_instance_role          = true
  iam_role_policy_document_json = "${data.aws_iam_policy_document.ec2_role_policy.json}"
}

# ROLE Policy
data "aws_iam_policy_document" "ec2_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }

    effect = "Allow"
  }
}

# IAM Policy
resource "aws_iam_policy" "custom_policy" {
  name   = "example_custom_ec2_policy"
  path   = "/custom/"
  policy = "${data.aws_iam_policy_document.custom_policy.json}"
}

# Policy Document for creating json
data "aws_iam_policy_document" "custom_policy" {
  statement {
    sid = "1"

    actions = [
      "ec2:CreateTags",
      "ec2:DeleteSnapshot",
      "ec2:DescribeImages",
      "ec2:DescribeInstances",
      "ec2:DescribeSnapshots",
      "ec2:DescribeVolumes",
      "ec2:TerminateInstances",
      "ses:SendEmail",
      "elasticloadbalancing:*",
    ]

    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = "2"

    actions = [
      "autoscaling:DeleteAutoScalingGroup",
      "autoscaling:DescribeAutoScalingGroups",
      "autoscaling:DescribeAutoScalingInstances",
      "autoscaling:DescribeLaunchConfigurations",
    ]

    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = "3"

    actions = [
      "sdb:BatchDeleteAttributes",
      "sdb:BatchPutAttributes",
      "sdb:DomainMetadata",
      "sdb:GetAttributes",
      "sdb:PutAttributes",
      "sdb:ListDomains",
      "sdb:CreateDomain",
      "sdb:Select",
    ]

    effect    = "Allow"
    resources = ["*"]
  }
}
