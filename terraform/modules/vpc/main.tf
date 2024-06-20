resource "aws_vpc" "vpc" { // Resource VPC
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames =  true
  tags = {
    Name = "${var.project_name}-vpc"
    }

}
resource "aws_internet_gateway" "igw" { // Resource Internet Gateway
  vpc_id = aws_vpc.vpc.id
}

resource "aws_eip" "nat" {  // Resource Elastic IP
  domain = "vpc" 
  depends_on                = [aws_internet_gateway.igw]
}


resource "aws_subnet" "public_a" {  // Resource Public subnet 1
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_a_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az_a
}

resource "aws_subnet" "public_b" { // Resource Public subnet 2
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_b_cidr
  map_public_ip_on_launch = true
  availability_zone       = var.az_b
}

resource "aws_subnet" "private_a" { // Resource private subnet 1
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_a_cidr
  availability_zone       = var.az_a
}

resource "aws_subnet" "private_b" {  // Resource private subnet 1
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_b_cidr
  availability_zone       = var.az_b
}

resource "aws_route_table" "public" {  // Resource Public Route Table
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}

resource "aws_route_table_association" "public_a" { // Resource Public Route Table Association wth subnet 1
  subnet_id      = aws_subnet.public_a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public_b" { // Resource Public Route Table Association wth subnet 1
  subnet_id      = aws_subnet.public_b.id
  route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "ngw" { // Resource Nat Gateway
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public_a.id
}

resource "aws_route_table" "private" { // Resource Private Route Table
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.ngw.id
  }
}
resource "aws_route_table_association" "private_a" { // Resource Private Route Table Association wth subnet 1
  subnet_id      = aws_subnet.private_a.id
  route_table_id = aws_route_table.private.id
}
resource "aws_route_table_association" "private_b" {  // Resource Private Route Table Association wth subnet 2
  subnet_id      = aws_subnet.private_b.id
  route_table_id = aws_route_table.private.id
}

