# Public SG
resource "aws_security_group" "public_sg" {
  vpc_id = var.vpc_id
  name   = "public-sg"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Private SG
resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id
  name   = "private-sg"

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.public_sg.id]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Public VM
resource "aws_instance" "public_vm" {
  ami           = var.ami
  instance_type = var.public_instance_type
  subnet_id     = var.public_subnet
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.public_sg.id]
  tags = { Name = "public-vm" }
}

# Private VM
resource "aws_instance" "private_vm" {
  ami           = var.ami
  instance_type = var.private_instance_type
  subnet_id     = var.private_subnet
  key_name      = var.key_name
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  tags = { Name = "private-vm" }
}
