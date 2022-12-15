locals {
  common_tags = {
    application : "app_name"
    application-id: "app_id"
    tooling : "terraform"
    business-unit : var.business_unit
    environment : var.environment
    project : var.project_name
    region : var.region
  }

  vpc_name = "ag-${var.environment}-${var.region}"
}
