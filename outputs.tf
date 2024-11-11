data "aws_caller_identity" "current" {}

output "bucket_name" {
  description = "Name of the S3 bucket for data"
  value       = "bucket-data-${data.aws_caller_identity.current.account_id}"
}

output "bucket_arn" {
  description = "ARN of the S3 bucket for data"
  value       = "arn:aws:s3:::bucket-data-${data.aws_caller_identity.current.account_id}"
}