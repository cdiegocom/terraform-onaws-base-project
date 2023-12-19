resource "aws_instance" "db" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"

    tags = {
        Name = "DB Server"
    }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}