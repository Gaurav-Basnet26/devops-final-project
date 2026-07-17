# Allocate an Elastic IP for the NAT Gateway
resource "aws_eip" "nat_eip" {

  domain = "vpc"

  tags = {
    Name = "employee-management-nat-eip"
  }

}

# Create the NAT Gateway in the Public Subnet
resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet.id

  depends_on = [
    aws_internet_gateway.igw
  ]

  tags = {
    Name = "employee-management-nat-gateway"
  }

}

