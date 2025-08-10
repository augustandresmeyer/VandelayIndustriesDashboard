resource "aws_subnet" "private_1" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_cidr1
    availability_zone = var.private_subnet_az1
    map_public_ip_on_launch = false
    tags = { Name = "vandelay-private-1" }
}

resource "aws_subnet" "private_2" {
    vpc_id = var.vpc_id
    cidr_block = var.private_subnet_cidr2
    availability_zone = var.private_subnet_az2
    map_public_ip_on_launch = false
    tags = { Name = "vandelay-private-2" }
}

resource "aws_route_table" "private_rt" {
    vpc_id = var.vpc_id
    tags = { Name = "vandelay-private-rt" }
}

resource "aws_route_table_association" "assoc_1" {
    subnet_id = aws_subnet.private_1.id
    route_table_id = aws_route_table.private_rt.id
}

resource "aws_route_table_association" "assoc_2" {
    subnet_id = aws_subnet.private_2.id
    route_table_id = aws_route_table.private_rt.id
}

locals {
  private_subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]
}

