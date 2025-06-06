resource "aws_vpc" "thush_virtual_network" {
    cidr_block = "10.0.0.0/16"
    enable_dns_hostnames = true
    enable_dns_support = true
    
    tags = {
      Name = "thush_virtual_network"
    }
}

# line 1 ->3 create a new Virtual Private Cloud : thush_virtual_network

# after create a vpc , create a new public subnet

resource "aws_subnet" "it_department_subnet" {
  vpc_id = aws_vpc.thush_virtual_network.id
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
  
  tags = {
    Name = "IT Department sub network"
  }
}


# add to the internet gateway accecc to internet

resource "aws_internet_gateway" "main_internet_gateway" {
    vpc_id = aws_vpc.thush_virtual_network.id

    tags = {
      Name = "Network GW"
    }
}


# create the routing table 

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.thush_virtual_network.id

  route  {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_internet_gateway.id
  }

  tags = {
    Name = "IT Department Routing table"
  }

}

resource "aws_route_table_association" "a" {
    subnet_id = aws_subnet.it_department_subnet.id
    route_table_id = aws_route_table.public_rt.id
  
}