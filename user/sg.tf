resource "aws_security_group" "sg-user" {
  name        = "allow_user-service"
  description = "allow_user-service"
  vpc_id      = var.VPC_ID

  ingress {
    from_port   = 7007
    to_port     = 7007
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
