# Terraform-aws-iam-role
Terraform module to create custom iam role with option to pass in custom policy or aws policy please see example for more details

# Usage

```hcl
module "iam_assume_role" {
  source                        = "anonymint/iam-role/aws"
  role_name                     = "ec2-container-instance-profile"
  policy_arns_count             = "1"
  policy_arns                   = ["arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role"]
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

``` 