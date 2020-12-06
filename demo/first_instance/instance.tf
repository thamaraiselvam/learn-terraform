provider "aws"{
    access_key = var.access_key
    secret_key = var.secret_key
    region = var.region
}


variable "region" {
    type = string
    default = "ap-south-1"
}

variable "access_key" {
    type = string
}

variable "secret_key" {
    type = string
}

resource "aws_instance" "example" {
    ami = "ami-005634d2b7691f303"
    instance_type = "t2.micro"
}
