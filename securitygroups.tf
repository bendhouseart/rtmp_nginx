resource "aws_security_group" "allow_http" {
  name = "allow_all_http"
  //vpc_id = aws_vpc.main.id

  ingress {
    from_port   = "80"
    to_port     = "80"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "allow_http"
  }
}

resource "aws_security_group" "allow_rtmp" {
  name = "allow_all_rtmp"
  //vpc_id = aws_vpc.main.id

  ingress {
    from_port   = "1935"
    to_port     = "1935"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }
  
  tags = {
      Name = "allow_rtmp"
  }
}

resource "aws_security_group" "allow_https" {
  name = "allow_all_https"
  //vpc_id = aws_vpc.main.id

  ingress {
    from_port   = "443"
    to_port     = "443"
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "allow_https"
  }
}

resource "aws_security_group" "allow_ssh" {
  name = "allow_all_ssh"
  //vpc_id = aws_vpc.main.id

  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = [var.MY_IP]
  }

  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "allow_ssh"
  }
}