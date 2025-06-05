variable "aws_region_name" {
    description = "AWS region to deploy"
    default = "us-west-01"
    type = string
}


variable "ami_id" {
  description = "Amazon Machine Image ID"
  default = ""
}