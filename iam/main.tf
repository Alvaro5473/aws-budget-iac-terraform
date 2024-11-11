resource "aws_iam_user" "user1" {
  name = var.user1_name
}

resource "aws_iam_user" "user2" {
  name = var.user2_name
}