resource "aws_db_subnet_group" "employee_db_subnet_group" {

  name = "employee-management-db-subnet-group"

  subnet_ids = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet_2.id
  ]

  tags = {
    Name = "employee-management-db-subnet-group"
  }

}
