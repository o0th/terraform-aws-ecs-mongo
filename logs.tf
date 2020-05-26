resource "aws_cloudwatch_log_group" "this" {
  count = var.cloudwatch >= 1 ? 1 : 0

  name              = var.name
  retention_in_days = var.cloudwatch
}
