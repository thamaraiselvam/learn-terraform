resource "aws_instance" "main_instance" {
  ami = lookup(var.AMIS, "ap-south-1")
  instance_type = "t2.micro"
  subnet_id = aws_subnet.main_public_a.id
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]
  key_name = aws_key_pair.mykeypair.id
}

resource "aws_security_group" "allow_ssh" {
  vpc_id = aws_vpc.main.id
  name = "allow-ssh"
  egress {
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "mykeypair" {
  key_name = "mykey"
  public_key = file("mykey.pub")
}