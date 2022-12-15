resource "aws_security_group" "this" {
  description = "Allow connection between NLB and target"
  vpc_id      = data.aws_vpc.vpc.id
}

resource "aws_security_group_rule" "ingress" {
  for_each = var.ports

  security_group_id = aws_security_group.this.id
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  type              = "ingress"
  cidr_blocks       = ["0.0.0.0/0"]
}