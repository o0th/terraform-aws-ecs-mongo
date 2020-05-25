### mongo with ebs

```hcl
module "mongo_ebs" {
  source = "github.com/clibot/terraform-aws-ecs-mongo"

  name  = "mongo-ebs"
  image = "docker.io/mongo:4.2.6"

  cluster = aws_ecs_cluster.development.name

  cpu    = 256
  memory = 512

  volume_type = "ebs"
  volume_size = 10

  vpc_id   = module.develop_vpc.vpc_id
  vpc_cidr = module.develop_vpc.vpc_cidr_block

  subnets = [
    module.develop_vpc.public_subnets[0],
    module.develop_vpc.public_subnets[1],
    module.develop_vpc.public_subnets[2]
  ]
}
```

### mongo with efs

```hcl
module "mongo_efs" {
  source = "github.com/clibot/terraform-aws-ecs-mongo"

  name  = "mongo-efs"
  image = "docker.io/mongo:4.2.6"

  cluster = aws_ecs_cluster.development.name

  cpu    = 256
  memory = 512

  volume_type = "efs"

  vpc_id   = module.develop_vpc.vpc_id
  vpc_cidr = module.develop_vpc.vpc_cidr_block

  subnets = [
    module.develop_vpc.public_subnets[0],
    module.develop_vpc.public_subnets[1],
    module.develop_vpc.public_subnets[2]
  ]
}
```
