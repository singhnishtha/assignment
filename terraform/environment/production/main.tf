

module "vpc" {
    source = "../../modules/vpc"
    project_name = "Test-Production"
    vpc_cidr             = "10.0.0.0/16"
    public_subnet_a_cidr = "10.0.1.0/24"
    public_subnet_b_cidr = "10.0.2.0/24"
    private_subnet_a_cidr = "10.0.3.0/24"
    private_subnet_b_cidr = "10.0.4.0/24"
    az_a                 = "ap-south-1a"
    az_b                 = "ap-south-1b"

}

module "sg_rds" {
  source       = "../../modules/sg"
  project_name = "Test-Production-rds"
  vpc_id       = module.vpc.vpc_id
ingress_rules = [
  {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["module.vpc.private_subnet_a_id"]
  },
]

egress_rules = [
  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
]


}
module "sg_ec2" {
  source       = "../../modules/sg"
  project_name = "Test-Production-rds"
  vpc_id       = module.vpc.vpc_id
  ingress_rules = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
  ]

  egress_rules = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]
}

module "ec2" {
    source            = "../../modules/ec2"
    project_name = "Test-Production"
    ami               = "ami-0c55b159cbfafe1f0" # Replace with your preferred AMI ID
    instance_type     = "t2.micro"
    subnet_id         = module.vpc.private_subnet_a_id
    security_group_id = [module.sg_ec2.security_group_id]
    key_name          = "my-key" # Replace with your key name
    iam_instance_profile = "ec2-s3-full-access" 
   
}




module "rds" {
  source               = "../../modules/rds"
  db_subnet_group_name = "my-db-subnet-group"
  project_name = "Test-Production"
  subnet_ids           = [module.vpc.private_subnet_b_id]
  allocated_storage    = 20
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  db_name              = "mydatabase"
  username             = "admin"
  password             = "mypassword" # Replace with your secure password
  parameter_group_name = "default.mysql5.7"
  security_group_id    = [module.sg_rds.security_group_id]

}