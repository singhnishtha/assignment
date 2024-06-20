output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "public_subnet_a_id" {
  value = aws_subnet.public_a.id
}

output "public_subnet_b_id" {
  value = aws_subnet.public_b.id
}

output "private_subnet_a_id" {
  value = aws_subnet.private_a.id
}

output "private_subnet_b_id" {
  value = aws_subnet.private_b.id
}

# output "public_security_group_id" {
#   value = aws_security_group.public_sg.id
# }


