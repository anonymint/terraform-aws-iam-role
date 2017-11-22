module "iam_assume_role" {
  source                        = "../../"
  role_name                     = "lambda-custom-role"
  policy_arns_count             = "2"
  policy_arns                   = ["${aws_iam_policy.custom_policy.arn}", "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"]
  create_instance_role          = false
  iam_role_policy_document_json = "${data.template_file.assume_role_policy.rendered}"
}

data "template_file" "assume_role_policy" {
  template = "${file("${path.module}/assume_role_policy.json")}"
}

# IAM Policy
resource "aws_iam_policy" "custom_policy" {
  name   = "example_custom_lambda_policy"
  path   = "/custom/"
  policy = "${file("${path.module}/custom_policy.json")}"
}

data "template_file" "custom_policy" {
  template = "${file("${path.module}/custom_policy.json")}"
}
