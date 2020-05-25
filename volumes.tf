resource "aws_efs_file_system" "this" {
  count = var.volume_type == "efs" ? 1 : 0

  creation_token = var.name

  tags = {
    Name = var.name
  }
}

resource "aws_efs_mount_target" "this" {
  count = var.volume_type == "efs" ? length(var.subnets) : 0

  file_system_id = aws_efs_file_system.this[0].id
  subnet_id      = var.subnets[count.index]
}

data "aws_subnet" "this" {
  id = var.subnets[0]
}

resource "aws_ebs_volume" "this" {
  count = var.volume_type == "ebs" ? 1 : 0

  availability_zone = data.aws_subnet.this.availability_zone
  size              = var.volume_size

  tags = {
    Name = var.name
  }
}
