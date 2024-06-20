variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
}

variable "subnet_id" {
  description = "The subnet ID to launch the instance in"
  type        = string
}

variable "security_group_id" {
  description = "The security group to associate with the instance"
  type        = list(string)
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "project_name" {
  description = "Project"
  type        = string
}
variable "iam_instance_profile" {
  description = "IAM Role"
  type        = string
}