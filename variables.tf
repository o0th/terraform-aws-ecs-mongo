variable "name" {
  type = string
}

variable "image" {
  type = string
}

variable "cluster" {
  type = string
}

variable "cpu" {
  type = number
}

variable "memory" {
  type = number
}

variable "subnets" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "volume_type" {
  type = string
}

variable "volume_size" {
  type    = number
  default = 0
}

variable "environment" {
  type    = list(object({ name = string, value = string }))
  default = []
}
