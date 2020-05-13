module "ec2" {
  source          = "git::https://chandralekha882:Opcqa123!@github.com/chandralek/modules.git//ec2"
  VPC_ID          = var.VPC_ID
  MGMT_VPC_ID     = var.MGMT_VPC_ID
  PRIVATE_SUBNETS = var.PRIVATE_SUBNETS
  PUBLIC_SUBNETS  = var.PUBLIC_SUBNETS
  TAGS            = var.TAGS
  INSTANCE_TYPE   = var.INSTANCE_TYPE
  SG              = aws_security_group.allow_mongodb_access.id
  NAME_TAG        = "mongodb-${var.TAGS["ENV"]}-instance"
}

resource "null_resource" "mongodb_instance_ssh" {
  connection {
    host = module.ec2.PRIVATE_IP
    user = var.SSH_USR
    password = var.SSH_PSW
  }
  provisioner "remote-exec" {
    inline = [
    "echo Hello"]
  }
}