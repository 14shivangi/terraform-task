resource "aws_instance" "app" {
    ami = "ami-0ac7b260cf76d8865"
    instance_type = "t3.micro"

    subnet_id = aws_subnet.public.id

    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    associate_public_ip_address = true

    key_name = "terraform-key"

    tags = {
      Name = "terraform-ec2"
    }
}