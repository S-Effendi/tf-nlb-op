variable "onprem_ips" {
  type    = map
  default = {
    #server  = "162.10.38.5"
    #server  = "10.258.18.7"
  }
}

resource "aws_lb_target_group" "rancher-op-tcp" {
  for_each = var.ports

  port        = each.value
  protocol    = "TCP"
  vpc_id      = data.aws_vpc.vpc.id
  target_type = "ip"

  health_check {
      healthy_threshold   = var.health_check["healthy_threshold"]
      interval            = var.health_check["interval"]
      unhealthy_threshold = var.health_check["unhealthy_threshold"]
      timeout             = var.health_check["timeout"]
  }

  depends_on = [
    aws_lb.this
  ]

lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_target_group_attachment" "this" {
  for_each = var.onprem_ips

  #id       = each.value.ip

  target_group_arn  = aws_lb_target_group.rancher-op-tcp[each.value].arn
  #target_id = "${element(var.onprem_ips.server.*.id, 1)}"
  target_id         = each.value.ip
  port              = each.value
}