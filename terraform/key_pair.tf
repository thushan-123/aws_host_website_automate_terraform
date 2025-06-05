resource "tls_private_key" "ec2_key" {
  algorithm = "RSA"
  rsa_bits = 4096
}

resource "aws_key_pair" "ec2_key" {
  key_name = "thush-key"
  public_key = tls_private_key.ec2_key.public_key_openssh
}

# save key pair in locle file

resource "local_file" "private_key" {
  content = tls_private_key.ec2_key.private_key_pem
  filename = "${path.module}/thush-key.pem"
  file_permission = "0400"
}