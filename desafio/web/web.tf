
resource "aws_instance" "web" {
    ami = "ami-0b55b3040fb5668a3"
    instance_type = "t3.micro"
    security_groups = [module.sg.sg_name]
    user_data = file("./web/server-script.sh")
    tags = {
        Name = "Web Server"
    }
}

output "pub_ip" {
    value = module.eip.PublicIP
}

module "eip" {
    source = "../eip"
    instance_id = aws_instance.web.id
}

module "sg" {
    source = "../sg"
}