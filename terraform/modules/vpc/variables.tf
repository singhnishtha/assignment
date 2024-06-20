variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnet_a_cidr" {
  description = "CIDR block for the public subnet in AZ A"
  type        = string
}

variable "public_subnet_b_cidr" {
  description = "CIDR block for the public subnet in AZ B"
  type        = string
}

variable "private_subnet_a_cidr" {
  description = "CIDR block for the private subnet in AZ A"
  type        = string
}

variable "private_subnet_b_cidr" {
  description = "CIDR block for the private subnet in AZ B"
  type        = string
}

variable "az_a" {
  description = "Availability zone A"
  type        = string
}

variable "az_b" {
  description = "Availability zone B"
  type        = string
}

variable "project_name" {
  description = "Project"
  type        = string
}