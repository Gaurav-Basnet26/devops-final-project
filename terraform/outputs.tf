output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.igw.id
}

output "security_group_id" {
  value = aws_security_group.employee_sg.id
}

# Bastion Host
output "bastion_instance_id" {
  value = aws_instance.employee_server.id
}

output "bastion_public_ip" {
  value = aws_instance.employee_server.public_ip
}

# Private EC2 - 1
output "private_server_1_id" {
  value = aws_instance.private_server_1.id
}

output "private_server_1_private_ip" {
  value = aws_instance.private_server_1.private_ip
}

# Private EC2 - 2
output "private_server_2_id" {
  value = aws_instance.private_server_2.id
}

output "private_server_2_private_ip" {
  value = aws_instance.private_server_2.private_ip
}
output "alb_dns_name" {
  description = "Application Load Balancer DNS Name"
  value       = aws_lb.employee_alb.dns_name
}

output "alb_arn" {
  description = "Application Load Balancer ARN"
  value       = aws_lb.employee_alb.arn
}

output "target_group_arn" {
  description = "Target Group ARN"
  value       = aws_lb_target_group.employee_tg.arn
}
output "launch_template_id" {

  value = aws_launch_template.employee_lt.id

}

output "autoscaling_group_name" {

  value = aws_autoscaling_group.employee_asg.name

}
output "rds_endpoint" {
  value = aws_db_instance.employee_db.endpoint
}

output "rds_database_name" {
  value = aws_db_instance.employee_db.db_name
}

output "rds_username" {
  value = aws_db_instance.employee_db.username
}
