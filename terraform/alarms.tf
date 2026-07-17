#############################################
# High CPU Alarm
#############################################

resource "aws_cloudwatch_metric_alarm" "high_cpu" {

  alarm_name          = "employee-management-high-cpu"
  alarm_description   = "Alarm when CPU exceeds 70%"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 70

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.employee_asg.name
  }
  alarm_actions = [
    aws_sns_topic.alerts.arn,
    aws_autoscaling_policy.scale_out.arn
  ]

  ok_actions = [
    aws_sns_topic.alerts.arn
  ]

  treat_missing_data = "missing"

  tags = {
    Name = "employee-management-high-cpu-alarm"
  }

}

#############################################
# Low CPU Alarm
#############################################

resource "aws_cloudwatch_metric_alarm" "low_cpu" {

  alarm_name          = "employee-management-low-cpu"
  alarm_description   = "Alarm when CPU drops below 20%"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 20

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.employee_asg.name
  }

  alarm_actions = [
    aws_sns_topic.alerts.arn,
    aws_autoscaling_policy.scale_in.arn
  ]
  ok_actions = [
    aws_sns_topic.alerts.arn
  ]

  treat_missing_data = "missing"

  tags = {
    Name = "employee-management-low-cpu-alarm"
  }

}
