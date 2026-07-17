resource "aws_instance" "private_server_1" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_subnet.id

  associate_public_ip_address = false

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.employee_sg.id
  ]

  tags = {
    Name = "employee-management-private-server"
  }

}
resource "aws_instance" "private_server_2" {

  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  subnet_id = aws_subnet.private_subnet.id

  associate_public_ip_address = false

  key_name = var.key_name

  vpc_security_group_ids = [
    aws_security_group.employee_sg.id
  ]

  tags = {
    Name = "employee-management-private-server-2"
  }
}
