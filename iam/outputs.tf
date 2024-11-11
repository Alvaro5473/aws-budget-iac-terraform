output "user1_arn" {
  description = "ARN of the first IAM user"
  value       = aws_iam_user.user1.arn
}

output "user2_arn" {
  description = "ARN of the second IAM user"
  value       = aws_iam_user.user2.arn
}