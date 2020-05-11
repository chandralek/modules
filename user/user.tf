module "ec2" {
  source          = "git::https://chandralekha882:Opcqa123!@github.com/chandralek/modules.git//ec2"
  VPC_ID          = var.VPC_ID
  MGMT_VPC_ID     = var.MGMT_VPC_ID
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
  PUBLIC_SUBNETS  = var.PUBLIC_SUBNETS
  TAGS            = var.TAGS
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  SG              = aws_security_group.sg-user.id
  NAME_TAG        = "user-${var.TAGS["PROJECT"]}-${var.TAGS["ENV"]}"
}

resource "null_resource" "Install_User_service" {
  provisioner "remote-exec" {
    connection {
      host = module.ec2.PRIVATE_IP
      user = var.SSH_USR
      password = var.SSH_PSW
    }
    inline = [
    "yum install ansible -y",
    ]
  }
}