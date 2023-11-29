provider "aws" {
  region     = "us-east-1"
}

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.http
    to_port          = var.http
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = var.ssh
    to_port          = var.ssh
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_security_group" "web_sg" {
  name        = var.web_sg
  
  vpc_id      = var.vpc_id

  ingress {
    description      = "TLS from VPC"
    from_port        = var.http
    to_port          = var.http
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }
    ingress {
    description      = "TLS from VPC"
    from_port        = var.ssh
    to_port          = var.ssh
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
   
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "web port 80"
  }
}