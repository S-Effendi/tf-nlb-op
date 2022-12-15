locals {
  common_tags = {
    application : "app_name"
    application-id: "app_id"
    tooling : "terraform"
    environment : var.environment
    region : var.region
  }

  vpc_name = "dave-${var.environment}-${var.region}"
}
