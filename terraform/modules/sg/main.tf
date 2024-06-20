resource "aws_security_group" "security_group" {
  vpc_id = var.vpc_id
    tags = {
    Name = "${var.project_name}-vpc"
    }
    dynamic "ingress" {
        # for_each = var.ingress_rules
        for_each = { for i, rule in var.ingress_rules : i => rule }
        content {
        from_port   = ingress.value.from_port
        to_port     = ingress.value.to_port
        protocol    = ingress.value.protocol
        cidr_blocks = ingress.value.cidr_blocks
        }
    }

    dynamic "egress" {
        for_each = { for i, rule in var.egress_rules : i => rule }
        content {
        from_port   = egress.value.from_port
        to_port     = egress.value.to_port
        protocol    = egress.value.protocol
        cidr_blocks = egress.value.cidr_blocks
        }
    }
}
