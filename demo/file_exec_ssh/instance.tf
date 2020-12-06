resource "aws_key_pair" "mykey" {
    key_name = "mykey"
    public_key = file(var.PUBLIC_KEY)
}

resource "aws_instance" "example" {
    ami = lookup(var.AMIS, var.AWS_REGION)
    instance_type = "t2.micro"
    key_name = aws_key_pair.mykey.key_name
    provisioner "file" {
        source = "script.sh"
        destination = "/tmp/script.sh"
    }
    provisioner "remote-exec" {
        inline = [
            "chmod +x /tmp/script.sh",
            "sudo /tmp/script.sh"
        ]
    }

    connection {
        host = self.public_ip
        user = var.AWS_USER
        private_key = file(var.PRIVATE_KEY)
    }
}
