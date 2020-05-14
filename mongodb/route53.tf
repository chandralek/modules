resource "aws_route53_record" "www" {
  zone_id = var.HOSTED_ZONE_ID
  name    = var.HOSTED_ZONE_NAME
  type    = "A"
  ttl     = "300"
  records = ["10.0.0.1"]
}