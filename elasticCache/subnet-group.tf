resource "aws_elasticache_subnet_group" "redis-subnet-group" {
  name       = "robo-shop-redis-subnet-group-${lower(var.PRIVATE_SUBNETS)}"
  subnet_ids = var.PRIVATE_SUBNETS
}