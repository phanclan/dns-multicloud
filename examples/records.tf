

# resource "aws_route53_record" "this" {
#   zone_id = data.aws_route53_zone.this.id
#   name = "test"
#   type = "A"
#   ttl = "300"
#   records = ["107.20.70.131"]
# }
# output "hashicat_dns" {
#   value = "http://${aws_route53_record.this.fqdn}"
# }



# resource "aws_route53_record" "this" {
#   # for_each = var.create && (var.zone_id != null || var.zone_name != null) ? local.recordsets : tomap({})

#   zone_id = data.aws_route53_zone.this[0].zone_id

#   name           = each.value.name != "" ? "${each.value.name}.${data.aws_route53_zone.this[0].name}" : data.aws_route53_zone.this[0].name
#   type           = each.value.type
#   ttl            = lookup(each.value, "ttl", null)
#   records        = lookup(each.value, "records", null)
#   set_identifier = lookup(each.value, "set_identifier", null)

#   dynamic "alias" {
#     for_each = length(keys(lookup(each.value, "alias", {}))) == 0 ? [] : [true]

#     content {
#       name                   = each.value.alias.name
#       zone_id                = each.value.alias.zone_id
#       evaluate_target_health = lookup(each.value.alias, "evaluate_target_health", false)
#     }
#   }

#   dynamic "weighted_routing_policy" {
#     for_each = length(keys(lookup(each.value, "weighted_routing_policy", {}))) == 0 ? [] : [true]

#     content {
#       weight = each.value.weighted_routing_policy.weight
#     }
#   }
# }


# output "this_route53_record_name" {
#   description = "The name of the record"
#   value       = { for k, v in aws_route53_record.this : k => v.name }
# }

# output "this_route53_record_fqdn" {
#   description = "FQDN built using the zone domain and name"
#   value       = { for k, v in aws_route53_record.this : k => v.fqdn }
# }


# variable "create" {
#   description = "Whether to create DNS records"
#   type        = bool
#   default     = true
# }

# variable "zone_id" {
#   description = "ID of DNS zone"
#   type        = string
#   default     = null
# }

# variable "zone_name" {
#   description = "Name of DNS zone"
#   type        = string
#   default     = null
# }

# variable "private_zone" {
#   description = "Whether Route53 zone is private or public"
#   type        = bool
#   default     = false
# }

# variable "records" {
#   description = "List of maps of DNS records"
#   type        = any
#   default     = []
# }