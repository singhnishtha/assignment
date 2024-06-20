output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_a_id" {
  value = module.vpc.public_subnet_a_id
}

output "public_subnet_b_id" {
  value = module.vpc.public_subnet_b_id
}

output "private_subnet_a_id" {
  value = module.vpc.private_subnet_a_id
}

output "private_subnet_b_id" {
  value = module.vpc.private_subnet_b_id
}
output "private_instance_id" {
  value = module.ec2.instance_id
}
output "ec2_security_group_id" {
  value = module.sg_ec2.security_group_id
}

output "rds_security_group_id" {
  value = module.sg_rds.security_group_id
}
