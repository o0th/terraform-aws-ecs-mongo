resource "aws_iam_role" "this" {
  name               = var.name
  assume_role_policy = file("${path.module}/policies/ecs-task-execution-role-policy.json")
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}
