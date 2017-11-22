output "this_iam_role_arn" {
  description = "The ARN of the role"
  value       = "${module.iam_assume_role.this_iam_role_arn}"
}

output "this_iam_role_id" {
  description = "The ID of the role"
  value       = "${module.iam_assume_role.this_iam_role_id}"
}

output "this_iam_role_name" {
  description = "The name of the role"
  value       = "${module.iam_assume_role.this_iam_role_name}"
}
