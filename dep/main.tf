provider "aws" {
    region = "us-east-1"
}

resource "aws_instance" "db" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"

    tags = {
      "Name" = "DB Server"
    }
}

resource "aws_instance" "web" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"

    depends_on = [aws_instance.db]
}

data "aws_instance" "dbsearch" {
	filter {
		name = "tag:Name"
		values = [ "DB Server" ]
	}
}

output "dbservers" {
	value = data.aws_instance.dbsearch.availability_zone
}
