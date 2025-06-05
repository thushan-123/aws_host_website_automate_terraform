resource "aws_instance" "web" {
  ami = var.ami_id
  instance_type = "t2.micro"
  subnet_id = aws_subnet.it_department_subnet.id
  vpc_security_group_ids = [aws_security_group.web_security_group.id]

  key_name = aws_key_pair.ec2_key.key_name

  user_data = local.ec2_user_data

  tags = {
    Name = "Voldemort HTTP WEB SERVER"
  }
}