variable "system_name" {
  type = string
  default = "terraform_template"
}

variable "instance_type" {
  type = string
  default = "t3.large"
}

variable "ebs_volume_type" {
  type = string
  default = "gp3"
}

variable "ebs_volume_size" {
  type = number
  default = 10
}

variable "ebs_iops" {
  type = number
  default = 3000
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "aws_subnet_id" {
  type = string
}
