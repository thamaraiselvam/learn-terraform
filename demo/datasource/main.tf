data "aws_ip_ranges" "southeast_ec2" {

  regions  = ["ap-south-1"]
  services = ["ec2"]
}

output "ip_ranges" {
  value = data.aws_ip_ranges.southeast_ec2
}

resource "aws_security_group" "from_southest" {

  name = "from_southeast"

  ingress {

    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = data.aws_ip_ranges.southeast_ec2.cidr_blocks

  }

  tags = {
    createTime = data.aws_ip_ranges.southeast_ec2.create_date
    syncTime   = data.aws_ip_ranges.southeast_ec2.sync_token
  }

}