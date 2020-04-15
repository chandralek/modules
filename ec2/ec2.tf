resource "aws_instance" "robo" {
  ami           = "ami-0777ff5c030fe1d38"
  instance_type = "t3.medium"
  subnet_id     = element(var.PRIVATE_SUBNETS,0)
  vpc_security_group_ids = [aws_security_group.allow_ssh_vpc.id]
}