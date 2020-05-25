data "template_file" "container_definitions" {
  template = file("${path.module}/container-definitions.tmpl")
  vars = {
    name               = var.name
    image              = var.image
    volume_name        = var.name
    volume_path        = "/data/db"
    logs_group         = var.name
    logs_stream_prefix = var.name
    logs_region        = "eu-west-1"
  }
}

resource "aws_ecs_task_definition" "this" {
  family                = var.name
  container_definitions = data.template_file.container_definitions

  volume {
    name = var.name
    efs_volume_configuration {
      file_system_id = aws_efs_file_system.this.id
    }
  }
}

resource "aws_ecs_service" "this" {
  name            = var.name
  cluster         = var.cluster
  task_definition = aws_ecs_task_definition.this.arn
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.this.arn
    container_name   = var.name
    container_port   = 27017
  }
}
