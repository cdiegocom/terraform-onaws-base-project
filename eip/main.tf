provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "ec2" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"
}

resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}
