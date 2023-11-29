terraform {
  backend "s3" {
    bucket = "terraform-state-bucket2311"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_instance" "ec2_public" {
ami             = var.ami_id
instance_type   = var.instance_type
key_name        = var.key_name
subnet_id     = var.subnet_1
security_groups = ["${aws_security_group.allow_tls.id}"]
associate_public_ip_address = true
}
output "server_private_ip" {
value = aws_instance.ec2_public.private_ip
}
output "server_public_ipv4" {
value = aws_instance.ec2_public.public_ip
}
output "server_id" {
value = aws_instance.ec2_public.id
}
