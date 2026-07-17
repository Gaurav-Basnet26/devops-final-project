resource "aws_launch_template" "employee_lt" {

  name_prefix = "employee-management-"

  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name

  vpc_security_group_ids = [
    aws_security_group.employee_sg.id
  ]

  monitoring {
    enabled = true
  }

  metadata_options {

    http_endpoint = "enabled"

    http_tokens = "required"

    http_put_response_hop_limit = 2

  }

  block_device_mappings {

    device_name = "/dev/sda1"

    ebs {

      volume_size = 20

      volume_type = "gp3"

      delete_on_termination = true

      encrypted = true

    }

  }

  user_data = base64encode(<<EOF
#!/bin/bash

set -e

# Update OS
apt-get update -y

# Install Docker
apt-get install -y docker.io

systemctl enable docker
systemctl start docker

# Pull the latest application image
docker pull gaurav0426/employee-management:latest

# Run the application
docker run -d \
  --name employee-management \
  --restart unless-stopped \
  -p 8080:8080 \
  -e SPRING_PROFILES_ACTIVE=aws \
  -e SPRING_DATASOURCE_URL="jdbc:postgresql://employee-management-db.c5iu2c2esf7g.ap-southeast-2.rds.amazonaws.com:5432/employee_db" \
  -e SPRING_DATASOURCE_USERNAME="employee" \
  -e SPRING_DATASOURCE_PASSWORD="employee123" \
  gaurav0426/employee-management:latest

EOF
  )
  tag_specifications {

    resource_type = "instance"

    tags = {

      Name = "employee-management-asg-instance"

      Project = "employee-management"

      Environment = "Development"

      ManagedBy = "OpenTofu"

    }

  }

  tags = {

    Name = "employee-management-launch-template"

  }

}
