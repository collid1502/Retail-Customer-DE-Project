# Create a Postgres database inside VPC 
// NOTE - RDS Instances can take c.10 Mins to spin up 
variable "POSTGRES_PW" {
    type = string
}

// specify the DB Subnet group, based upon the postgresql subnet 1 & 2 created in subnets.tf 
resource "aws_db_subnet_group" "postgresql_subnet_group" {
    name       = "postgresubgroup"
    subnet_ids = ["${aws_subnet.postgresql_subnet1.id}",  
        "${aws_subnet.postgresql_subnet2.id}"]

    tags = {
        Name = "PostgreSQL subnet group"
    }
}

resource "aws_db_instance" "Retail_DE_MetadataDB" {
  identifier            = "retail-rules-repo"
  engine                = "postgres"
  instance_class        = "db.m5.large" # 2 vCPUs 8 GiB RAM
  username              = "Retail_DE_Admin"
  password              = var.POSTGRES_PW 
  skip_final_snapshot   = true
  allocated_storage     = 200 # Min allocated storage 100GiB
  storage_type          = "gp2"
  engine_version        = "14.5"
  vpc_security_group_ids = ["${aws_security_group.rds_postgres_sg.id}"]
  publicly_accessible   = false  # Set to true if you want the database to be publicly accessible
  db_subnet_group_name = aws_db_subnet_group.postgresql_subnet_group.name
  tags = {
    Name = "Rules_Repo_Master"
  }
}
