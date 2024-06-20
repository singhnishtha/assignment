variable "vpc_id" {
  description = "VPC Id"
  type        = string
}

# variable "ingress_rules" {
#   type        = map(any)
#   description = "create map with key value pairs with key as strings and values as map containing from_port, to_port, protocol, cidr_blocks, source_security_group_id"

# }

# variable "egress_rules" {
# type        = map(any)
#   description = "create map with key value pairs with key as strings and values as map containing from_port, to_port, protocol, cidr_blocks, source_security_group_id"
# }
variable "ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = list(string)
    }))
}
variable "egress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_blocks  = list(string)
    }))
}
variable "project_name" {
  description = "Project"
  type        = string
}