#Ec2 Scurity Group
resource "aws_security_group" "ec2_sg"{
    name = "ec2-sg"
    description = "allow SSH access to EC2"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "ec2-sg"
    }
}

#RDS SecurityGroup
resource "aws_security_group" "rds_sg"{
    name = "rds-sg"
    description = "allow MySQL access from EC2"
    vpc_id = aws_vpc.main.id

    ingress {
        description = "MySQL from EC2"
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        security_groups = [aws_security_group.ec2_sg.id]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
      Name = "rds-sg"
    }
  
}