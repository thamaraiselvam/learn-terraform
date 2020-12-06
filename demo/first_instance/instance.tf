provider "aws"{
    access_key = var.AWS_ACCESS_TOKEN
    secret_key = var.AWS_SECRET_TOKEN
    region = var.region
}

resource "aws_instance" "example" {
    ami = "ami-005634d2b7691f303"
    instance_type = "t2.micro"
}
