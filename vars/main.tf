provider "aws" {
    region = "us-east-1"
}

variable "number_of_servers" {
    type = number
}

resource "aws_instance" "ec2" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"
    count = var.number_of_servers
}
