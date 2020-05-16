locals {
  DNS_NAME = "rabbitmq-${var.TAGS["env"]}.${var.HOSTED_ZONE_NAME}}"
  NAME_TAG = "rabbitmq-${var.TAGS["env"]}-service"
}