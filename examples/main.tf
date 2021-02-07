module "zones" {
  source = "./.."
  hosted-zone = "hashidemos.io"
  namespace = "pphan"
  owner = "pphan@hashicorp.com"
  create_aws_dns_zone = "true"
  create_azure_dns_zone = "false"
  create_gcp_dns_zone = "true"
  aws_region = "us-west-2"
  azure_location = "us-west"
  gcp_region = "us-west"
  gcp_project = "pphan-test-app-dev"
}

data "aws_route53_zone" "this" {
  # count = var.create && (var.zone_id != null || var.zone_name != null) ? 1 : 0

  zone_id      = module.zones.aws_sub_zone_id[0] # aws_route53_zone.aws_sub_zone[0].zone_id # var.zone_id
  # name         = var.zone_name
  # private_zone = var.private_zone
  # depends_on = [ module.zones ]
}

module "records" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  version = "~> 1.0"
  zone_name = data.aws_route53_zone.this.name  # Name of DNS zone -
  records = [
    {
      name    = "apigateway1"
      type    = "A"
      ttl     = 1800
      records = [
        "8.8.8.7",
      ]
    }
  ]
}
# output "this_route53_record_name" {
#   description = "The name of the record"
#   value       = module.records.this_route53_record_name
# }
# output "this_route53_record_fqdn" {
#   description = "FQDN built using the zone domain and name"
#   value       = module.records.this_route53_record_fqdn
# }