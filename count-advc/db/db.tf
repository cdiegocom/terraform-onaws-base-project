variable "server_names" {
    type = list(string)
}

resource "aws_instance" "db" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"
    count = length(var.server_names)
    tags = {
        Name = var.server_names[count.index]
    }
}

output "PrivateIP" {
    value = [aws_instance.db.*.private_ip]
}