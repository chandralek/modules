resource "aws_route53_record" "www" {
  zone_id = "${aws_route53_zone.primary.zone_id}"
  name    = "www.example.com"
  type    = "CNAME"
  ttl     = "5"
  records = [aws_lb.frontend_alb.dns_name]
}