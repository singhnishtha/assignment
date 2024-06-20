resource "aws_db_subnet_group" "rds_instance_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.subnet_ids

  tags = {
    Name = var.db_subnet_group_name
  }
}

resource "aws_db_instance" "rds_instance" {
  allocated_storage      = var.allocated_storage
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.db_name
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  db_subnet_group_name   = aws_db_subnet_group.rds_instance_subnet_group.name
  vpc_security_group_ids = var.security_group_id
  skip_final_snapshot    = true

  tags = {
    Name = "${var.project_name}-rds"
  }
}
