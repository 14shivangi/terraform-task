output "vpc_id" {
    description = "VPC ID"
    value = aws_vpc.main.id
}

output "ec2_public_ip" {
    description = "public IP of EC2"
    value = aws_instance.app.public_ip
}

output "rds_endpoint" {
    description = "RDS Mysql endpoint"
    value = aws_db_instance.mysql.address
}

output "rds_port" {
    description = "Rds mysql port"
    value = aws_db_instance.mysql.port
}

output "ec2_instance_id" {
    description = "EC2 instance id"
    value = aws_instance.app.id
}