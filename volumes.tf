resource "aws_efs_file_system" "this" {
  creation_token = var.name
  tags = {
    Name = var.name
  }
}

resource "aws_efs_mount_target" "this" {
  count = length(var.subnets)

  file_system_id = aws_efs_file_system.this.id
  subnet_id      = var.subnets[count.index]
}
