resource "aws_lb" "employee_alb" {

  name = "employee-management-alb"

  internal = false

  load_balancer_type = "application"

  security_groups = [
    aws_security_group.alb_sg.id
  ]

  subnets = [
    aws_subnet.public_subnet.id,
    aws_subnet.public_subnet_2.id

  ]

  enable_deletion_protection = false

  tags = {
    Name = "employee-management-alb"
  }

}
