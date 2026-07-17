resource "aws_lb_target_group" "employee_tg" {

  name     = "employee-management-tg-v3"
  port     = 8080
  protocol = "HTTP"

  vpc_id = aws_vpc.main.id

  health_check {

    enabled = true

    path = "/"

    protocol = "HTTP"

    port = "traffic-port"

    matcher = "200"

    interval = 30

    timeout = 5

    healthy_threshold = 2

    unhealthy_threshold = 2

  }

  tags = {

    Name = "employee-management-target-group"

  }

}
