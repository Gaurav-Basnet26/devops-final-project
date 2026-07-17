resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_cidr

  availability_zone = "ap-southeast-2a"

  map_public_ip_on_launch = true

  tags = {

    Name = "employee-management-public-subnet"

  }

}

resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_cidr

  availability_zone = "ap-southeast-2b"

  tags = {

    Name = "employee-management-private-subnet"

  }

}
resource "aws_subnet" "public_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.public_subnet_2_cidr

  availability_zone = "ap-southeast-2b"

  map_public_ip_on_launch = true

  tags = {
    Name = "employee-management-public-subnet-2"
  }

}
resource "aws_subnet" "private_subnet_2" {

  vpc_id = aws_vpc.main.id

  cidr_block = var.private_subnet_2_cidr

  availability_zone = "ap-southeast-2a"

  tags = {
    Name = "employee-management-private-subnet-2"
  }

}
