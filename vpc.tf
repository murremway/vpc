#Create AWS VPC
resource "aws_vpc" "YOUR_DESIRED_NAME" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"
  enable_dns_support   = "true"
  enable_dns_hostnames = "true"
  enable_classiclink   = "false"

  tags = {
    Name = "YOUR_DESIRED_NAME"
  }
}

# Public Subnets in Custom VPC
resource "aws_subnet" "YOUR_DESIRED_NAME-public-1" {
  vpc_id                  = aws_vpc.YOUR_DESIRED_NAME.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2a"

  tags = {
    Name = "YOUR_DESIRED_NAME-public-1"
  }
}

resource "aws_subnet" "YOUR_DESIRED_NAME-public-2" {
  vpc_id                  = aws_vpc.YOUR_DESIRED_NAME.id
  cidr_block              = "10.0.2.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2b"

  tags = {
    Name = "YOUR_DESIRED_NAME-public-2"
  }
}

resource "aws_subnet" "YOUR_DESIRED_NAME-public-3" {
  vpc_id                  = aws_vpc.YOUR_DESIRED_NAME.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "us-east-2c"

  tags = {
    Name = "YOUR_DESIRED_NAME-public-3"
  }
}

# Private Subnets in Custom VPC
resource "aws_subnet" "YOUR_DESIRED_NAME-private-1" {
  vpc_id                  = aws_vpc.YOUR_DESIRED_NAME.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2a"

  tags = {
    Name = "YOUR_DESIRED_NAME-private-1"
  }
}

resource "aws_subnet" "YOUR_DESIRED_NAME-private-2" {
  vpc_id                  = aws_vpc.YOUR_DESIRED_NAME.id
  cidr_block              = "10.0.5.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2b"

  tags = {
    Name = "YOUR_DESIRED_NAME-private-2"
  }
}

resource "aws_subnet" "YOUR_DESIRED_NAME-private-3" {
  vpc_id                  = aws_vpc.YOUR_DESIRED_NAME.id
  cidr_block              = "10.0.6.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "us-east-2c"

  tags = {
    Name = "YOUR_DESIRED_NAME-private-3"
  }
}

# Custom internet Gateway
resource "aws_internet_gateway" "levelup-gw" {
  vpc_id = aws_vpc.YOUR_DESIRED_NAME.id

  tags = {
    Name = "levelup-gw"
  }
}

#Routing Table for the Custom VPC
resource "aws_route_table" "levelup-public" {
  vpc_id = aws_vpc.YOUR_DESIRED_NAME.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.levelup-gw.id
  }

  tags = {
    Name = "levelup-public-1"
  }
}

resource "aws_route_table_association" "levelup-public-1-a" {
  subnet_id      = aws_subnet.YOUR_DESIRED_NAME-public-1.id
  route_table_id = aws_route_table.levelup-public.id
}

resource "aws_route_table_association" "levelup-public-2-a" {
  subnet_id      = aws_subnet.YOUR_DESIRED_NAME-public-2.id
  route_table_id = aws_route_table.levelup-public.id
}

resource "aws_route_table_association" "levelup-public-3-a" {
  subnet_id      = aws_subnet.YOUR_DESIRED_NAME-public-3.id
  route_table_id = aws_route_table.levelup-public.id
}

