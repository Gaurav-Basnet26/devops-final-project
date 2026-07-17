resource "aws_autoscaling_group" "employee_asg" {

  name = "employee-management-asg"

  min_size         = 2
  desired_capacity = 2
  max_size         = 4

  health_check_type         = "ELB"
  health_check_grace_period = 300

  vpc_zone_identifier = [
    aws_subnet.private_subnet.id,
    aws_subnet.private_subnet_2.id
  ]

  target_group_arns = [
    aws_lb_target_group.employee_tg.arn
  ]

  launch_template {

    id      = aws_launch_template.employee_lt.id
    version = "$Latest"

  }

  instance_refresh {

    strategy = "Rolling"

    preferences {

      min_healthy_percentage = 50

    }

  }

  enabled_metrics = [

    "GroupDesiredCapacity",

    "GroupInServiceInstances",

    "GroupPendingInstances",

    "GroupTerminatingInstances",

    "GroupTotalInstances"

  ]

  tag {

    key                 = "Name"
    value               = "employee-management-asg-instance"
    propagate_at_launch = true

  }

  tag {

    key                 = "Project"
    value               = "employee-management"
    propagate_at_launch = true

  }

  tag {

    key                 = "ManagedBy"
    value               = "OpenTofu"
    propagate_at_launch = true

  }

  lifecycle {

    create_before_destroy = true

  }

}
