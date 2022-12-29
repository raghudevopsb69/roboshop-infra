resource "aws_instance" "ec2" {
  count                  = length(var.instances)
  ami                    = data.aws_ami.centos8.id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  tags = {
    Name = element(var.instances, count.index)
  }
}

data "aws_ami" "centos8" {
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
  owners      = ["973714476881"]
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = "vpc-042992ad68653bd97"

  ingress {
    description = "ALL"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

data "aws_route53_zone" "domain" {
  name = var.DOMAIN_NAME
}

resource "aws_route53_record" "dns-record" {
  count   = length(var.instances)
  zone_id = data.aws_route53_zone.domain.zone_id
  name    = "${var.ENV}-${element(var.instances, count.index)}.${var.DOMAIN_NAME}"
  type    = "A"
  ttl     = 30
  records = [element(aws_instance.ec2.*.private_ip, count.index)]
}

resource "null_resource" "ansible-apply" {
  count = length(var.instances)
  provisioner "remote-exec" {
    connection {
      host     = element(aws_instance.ec2.*.private_ip, count.index)
      user     = "root"
      password = "DevOps321"
    }
    inline = [
      "echo Hello"
    ]
  }
}

