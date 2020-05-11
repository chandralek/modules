resource "aws_security_group" "sg-user" {
  name        = "allow_mysql_access"
  description = "Allow mysql Access"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = var.APPLICATION_PORT
    to_port     = var.APPLICATION_PORT
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block,data.aws_vpc.management-vpc.cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [data.aws_vpc.main.cidr_block,data.aws_vpc.management-vpc.cidr_block]
  }

  tags = {
    Name = "allow_user"
  }
}
