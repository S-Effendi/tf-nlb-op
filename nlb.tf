resource "aws_lb" "this" {
  name                  = "this-nlb"
  load_balancer_type    = "network"
  subnets               = data.aws_subnets.compute_subnet.ids

  internal                          = true
  enable_cross_zone_load_balancing  = true
  enable_deletion_protection        = true

}   