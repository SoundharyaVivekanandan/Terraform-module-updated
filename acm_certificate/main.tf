 /* resource "aws_acm_certificate" "example" {
  domain_name       = var.domain_name
  validation_method = "DNS"
}

resource "aws_route53_record" "example" {
  zone_id = var.route53_zone_id
  name    = "_acm-validation.${var.domain_name}"
  type    = "CNAME"
  records = [aws_acm_certificate.example.domain_validation_options.0.resource_record_name]
  ttl     = 300
}

resource "aws_acm_certificate_validation" "example" {
  certificate_arn         = aws_acm_certificate.example.arn
  validation_record_fqdns = [aws_route53_record.example.fqdn]
}

output "certificate_arn" {
  value = aws_acm_certificate.example.arn
}   */
