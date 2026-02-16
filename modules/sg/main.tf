resource "aws_security_group" "alb" {
   name        = "alb security group"
   description = "enable http/https access on port 80/443"
   vpc_id      = var.vpc_id
  # ... other configuration ...
  ingress {
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "alb_sg"
  }
}


resource "aws_security_group" "client" {
  # ... other configuration ...
  name        = "client_sg"
  description = "enable http/https access on port 80 for elb sg"
  vpc_id      = var.vpc_id
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb.id]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Client_sg"
  }
}


resource "aws_security_group" "db_sg" {
  # ... other configuration ...
  name        = "db_sg"
  description = "enable http/https access on port 3305 for elb sg"
  vpc_id      = var.vpc_id
  ingress {
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    security_groups = [aws_security_group.client.id]
    
  }
  ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "Client_sg"
  }
}