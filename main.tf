resource "aws_iam_role" "this" {
  name               = var.role_name
  assume_role_policy = var.iam_role_policy_document_json
}

resource "aws_iam_role_policy_attachment" "attachment" {
  count      = var.policy_arns_count
  role       = aws_iam_role.this.name
  policy_arn = var.policy_arns[count.index]
}

resource "aws_iam_instance_profile" "instance_profile" {
  count = var.create_instance_role
  name  = aws_iam_role.this.name
  role  = aws_iam_role.this.name
}
