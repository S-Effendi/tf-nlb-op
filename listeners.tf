variable "ports" {
  type    = map(number)
  default = {
    http  = 80
    https = 443
  }
}

resource "aws_lb_listener" "this" {
  for_each = var.ports

  load_balancer_arn = aws_lb.this.arn

  protocol          = "TCP"
  port              = each.value

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rancher-op-tcp[each.key].arn
  }
}