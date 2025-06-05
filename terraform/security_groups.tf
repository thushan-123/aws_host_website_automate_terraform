resource "aws_security_group" "web_security_group" {
    name = "allow_web_traffic"
    description = "Allow All http/https and SSH port"
    vpc_id = aws_vpc.thush_virtual_network.id

    # Added inbound rules     --- security group is instance firewall it is statefull firewall

    ingress {
        description = "HTTP"     # Allow http trafic 
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "HTTPS"
        from_port = 443
        to_port = 443
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    ingress {
        description = "SSH"   # allow ssh trafic
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [ "0.0.0.0/0" ]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = [ "0.0.0.0/0" ]

    }
}