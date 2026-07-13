data "aws_ami" "amazon_linux" {
  most_recent = true
  owners = ["amazon"]
  filter { name = "name"; values = ["al2023-ami-2023.*-x86_64"] }
}
resource "aws_security_group" "web" {
  name = "${var.name_prefix}-web-sg"; vpc_id = var.vpc_id
  ingress { from_port = 80; to_port = 80; protocol = "tcp"; cidr_blocks = ["0.0.0.0/0"] }
  ingress { from_port = 22; to_port = 22; protocol = "tcp"; cidr_blocks = [var.admin_cidr] }
  egress { from_port = 0; to_port = 0; protocol = "-1"; cidr_blocks = ["0.0.0.0/0"] }
}
resource "aws_instance" "web" {
  ami = data.aws_ami.amazon_linux.id
  instance_type = var.instance_type
  subnet_id = var.public_subnet_id
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true
  user_data = <<-EOT
#!/bin/bash
dnf install -y httpd
systemctl enable --now httpd
echo "Terraform Enterprise Platform" > /var/www/html/index.html
EOT
  tags = { Name = "${var.name_prefix}-web" }
}
