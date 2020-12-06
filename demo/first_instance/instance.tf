provider "aws"{
    access_key = var.AWS_ACCESS_KEY
    secret_key = var.AWS_SECRET_KEY
    region = var.region
}

resource "aws_instance" "example" {
    ami = lookup(var.AMIS, var.region)
    instance_type = "t2.micro"
}
