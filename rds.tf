#RDS DB Subnet Group 
resource "aws_db_subnet_group" "mysql" {
    name = "terraform-mysql-subnet-group"

    subnet_ids = [aws_subnet.private1.id , aws_subnet.private_2.id]

    tags = {
        Name = "terraform-mysql-subnet-group"
        }
}

#RDS MySQL 
resource "aws_db_instance" "mysql" {
    identifier = "terraform-mysql"

    engine = "mysql"
    engine_version = "8.0"

    instance_class = "db.t3.micro"
    allocated_storage = 20
    max_allocated_storage = 50

    db_name = "contactdb"
    username = "var.db_username"
    password = "var.db_password"

    db_subnet_group_name = aws_db_subnet_group.mysql.name

    vpc_security_group_ids = [aws_security_group.rds_sg.id]

    publicly_accessible = false

    skip_final_snapshot = true

    tags = {
      Name = "terraform-mysql"
    }
}