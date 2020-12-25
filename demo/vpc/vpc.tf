resource "aws_vpc" "main" {
  cidr_block = "10.1.0.0/16"
  instance_tenancy = "default"
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "name" = "tom"
  }
}

resource "aws_subnet" "main_public_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.1.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "main_public_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.2.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1b"
}

resource "aws_subnet" "main_public_c" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.3.0/24"
  map_public_ip_on_launch = true
  availability_zone = "ap-south-1c"
}

resource "aws_subnet" "main_private_a" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.4.0/24"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1a"
}

resource "aws_subnet" "main_private_b" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.5.0/24"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1b"
}

resource "aws_subnet" "main_private_c" {
  vpc_id = aws_vpc.main.id
  cidr_block = "10.1.6.0/24"
  map_public_ip_on_launch = false
  availability_zone = "ap-south-1c"
}

resource "aws_internet_gateway" "main_gw" {
  vpc_id = aws_vpc.main.id
}

resource "aws_route_table" "main_rt" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.main_gw.id
  }
}

resource "aws_route_table_association" "main_public_a" {
  route_table_id = aws_route_table.main_rt.id
  subnet_id = aws_subnet.main_public_a.id
}

resource "aws_route_table_association" "main_public_b" {
  route_table_id = aws_route_table.main_rt.id
  subnet_id = aws_subnet.main_public_b.id
}

resource "aws_route_table_association" "main_public_c" {
  route_table_id = aws_route_table.main_rt.id
  subnet_id = aws_subnet.main_public_c.id
}