module "iam_assume_role" {
  source               = "../../"
  role_name            = "s3-custom-role"
  policy_arns_count    = "2"
  policy_arns          = ["${aws_iam_policy.custom_policy.arn}", "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"]
  create_instance_role = false

  iam_role_policy_document_json = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "s3.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

# IAM Policy
resource "aws_iam_policy" "custom_policy" {
  name = "example_custom_s3_policy"
  path = "/custom/"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": "*"
        }
    ]
}
EOF
}
