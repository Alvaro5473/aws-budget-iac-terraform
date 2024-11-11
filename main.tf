resource "aws_budgets_budget" "ec2" {
  name              = "budget_terraform"
  budget_type       = "COST"
  limit_amount      = "25"
  limit_unit        = "USD"
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2017-07-01_00:00"
  time_unit         = "MONTHLY"

  cost_filter {
    name = "Service"
    values = [
      "Amazon Elastic Compute Cloud - Compute",
    ]
  }

  notification {
    comparison_operator        = "GREATER_THAN"
    threshold                  = 5
    threshold_type             = "PERCENTAGE"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = [var.notification_email]
  }

  tags = {
    nombre = "Álvaro"
    iac =    "terraform"
    env =    "Automatización y despliegue"
  }

  terraform {
    backend "s3" {
      encrypt = true
      bucket = "terraform-infrastructure-654654536453"
      dynamodb_table = "terraform-state-lock"
      key = "terraform.tfstate"
      region = "eu-north-1"
    }
  }
}

module "iam" {
  source = "./iam"
  user1_name = var.user1_name
  user2_name = var.user2_name
}