resource "aws_security_group" "employee_sg" {

  name        = "employee-management-sg"
  description = "Employee Management Security Group"
  vpc_id      = aws_vpc.main.id

  # SSH from anywhere (for lab purposes)
  ingress {

    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = ["0.0.0.0/0"]

  }

  # HTTP traffic only from the ALB
  ingress {

    description = "Aplication from ALB"

    from_port = 8080
    to_port   = 8080
    protocol  = "tcp"

    security_groups = [
      aws_security_group.alb_sg.id
    ]

  }

  egress {

    from_port = 0
    to_port   = 0
    protocol  = "-1"

    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {

    Name = "employee-management-sg"

  }

}
