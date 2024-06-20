resource "aws_instance" "ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  vpc_security_group_ids             = var.security_group_id
  associate_public_ip_address = false
  key_name                    = var.key_name
  iam_instance_profile = var.iam_instance_profile

  tags = {
    Name = "${var.project_name}-ec2"
  }
}