resource "aws_security_group" "db_sg" {

  name = "employee-management-db-sg"

  description = "Database Security Group"

  vpc_id = aws_vpc.main.id

  ingress {

    description = "PostgreSQL"

    from_port = 5432

    to_port = 5432

    protocol = "tcp"

    security_groups = [
      aws_security_group.employee_sg.id
    ]

  }

  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = [
      "0.0.0.0/0"
    ]

  }

  tags = {

    Name = "employee-management-db-sg"

  }

}

