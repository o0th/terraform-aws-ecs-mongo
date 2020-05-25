resource "aws_efs_file_system" "this" {
  creation_token = "${var.env}-mongo"
  tags = {
    Name = "${var.project.env}-mongo"
  }
}

resource "aws_efs_mount_target" "this" {
  count = length(var.subnets)

  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.subnets[count.index]
}
