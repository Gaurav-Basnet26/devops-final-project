resource "aws_db_instance" "employee_db" {

  identifier = "employee-management-db"

  engine = "postgres"

  engine_version = "16"

  instance_class = var.db_instance_class

  allocated_storage = var.db_allocated_storage

  storage_type = "gp3"

  storage_encrypted = true

  db_name = var.db_name

  username = var.db_username

  password = var.db_password

  publicly_accessible = false

  multi_az = false

  skip_final_snapshot = true

  deletion_protection = false

  db_subnet_group_name = aws_db_subnet_group.employee_db_subnet_group.name

  vpc_security_group_ids = [
    aws_security_group.db_sg.id
  ]

  backup_retention_period = 7

  auto_minor_version_upgrade = true

  tags = {

    Name = "employee-management-postgres"

  }

}
