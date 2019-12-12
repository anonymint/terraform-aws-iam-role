variable "role_name" {
  description = "Role name"
}

variable "iam_role_policy_document_json" {
  type = string

  description = <<EOF
  Valid JSON Policy String
  this can be constructed from
  * terraform data.aws_iam_policy_document
  * terraform file provider
EOF
}

variable "policy_arns" {
  type        = list
  description = "List of policy arns to attach to this role"
  default     = []
}

variable "policy_arns_count" {
  description = "number of policy arns due to bug with length of computed value"
}

variable "create_instance_role" {
  description = "Need to create a same name instance role or not"
  default     = false
}
