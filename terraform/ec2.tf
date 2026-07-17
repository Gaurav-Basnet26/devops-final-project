resource "aws_instance" "employee_server" {

  ami = data.aws_ami.ubuntu.id

  instance_type = var.instance_type

  subnet_id = aws_subnet.public_subnet.id

  associate_public_ip_address = true

  key_name = var.key_name

  vpc_security_group_ids = [

    aws_security_group.employee_sg.id

  ]

  tags = {

    Name = "employee-management-server"

  }

}
