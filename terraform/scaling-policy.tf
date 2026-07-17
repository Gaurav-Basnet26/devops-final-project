#############################################
# Scale Out Policy
#############################################

resource "aws_autoscaling_policy" "scale_out" {

  name = "employee-management-scale-out"

  adjustment_type = "ChangeInCapacity"

  scaling_adjustment = 1

  cooldown = 300

  autoscaling_group_name = aws_autoscaling_group.employee_asg.name

}

#############################################
# Scale In Policy
#############################################

resource "aws_autoscaling_policy" "scale_in" {

  name = "employee-management-scale-in"

  adjustment_type = "ChangeInCapacity"

  scaling_adjustment = -1

  cooldown = 300

  autoscaling_group_name = aws_autoscaling_group.employee_asg.name

}
