variable "aws_region_name" {
    description = "AWS region to deploy"
    default = "us-west-01"
    type = string
}


variable "ami_id" {
  description = "Amazon Machine Image ID"
  default = ""
}

variable "key_name" {
  description = "EC2 Instence key-pare name"
  type = string
}

variable "developer" {
  description = "Developer Name"
  default = "Thush"
  type = string
}