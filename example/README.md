# IAM Role

In these examples you can see a different way to create a role based on your preference

* iam_role_ec2 - using `data.aws_iam_policy_document` to eventually create json
* iam_role_lambda - using `template.file` to read json file from raw file
* iam_role_s3 - using inline json inside terrafom itself 