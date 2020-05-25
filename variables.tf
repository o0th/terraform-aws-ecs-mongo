variable "name" {
  type = string
}

variable "env" {
  type = string
}

variable "image" {
  type = string
}

variable "cluster" {
  type = string
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
