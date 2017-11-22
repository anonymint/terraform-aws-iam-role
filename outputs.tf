output "this_iam_role_arn" {
  description = "The ARN of the role"
  value       = "${aws_iam_role.this.arn}"
}

output "this_iam_role_id" {
  description = "The ID of the role"
  value       = "${aws_iam_role.this.id}"
}

output "this_iam_role_name" {
  description = "The name of the role"
  value       = "${aws_iam_role.this.name}"
}
