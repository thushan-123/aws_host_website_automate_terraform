variable "aws_region_name" {
    description = "AWS region to deploy"
    default = "us-east-1"
    type = string
}


variable "ami_id" {
  description = "Amazon Machine Image ID"
  default = "ami-02457590d33d576c3"      # AMI ID Amazon linux machine image
}

variable "key_name" {
  description = "EC2 Instence key-pare name"
  type = string
  default = "value"
}

variable "developer" {
  description = "Developer Name"
  default = "Thush"
  type = string
}