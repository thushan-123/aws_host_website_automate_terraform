resource "aws_instance" "web" {
  ami = ""
  instance_type = "t2.micro"
  subnet_id = aws_subnet.it_department_subnet.id
  vpc_security_group_ids = [aws_security_group.web_security_group.id]
}