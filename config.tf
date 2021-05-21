#My Task 

provider "aws" {
    access_key = var.i_access_key
    secret_key = var.i_secret_key
    region     = "us-west-2"
}

resource "aws_instance" "my_webserver" {
  ami                    = "ami-03d5c68bab01f3496"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver_group.id]
  user_data              = file("user_data.sh")

  tags = {
      name  = "WebServer for Task"
      owner = "Harchenko Anastasia"
  }
}

resource "aws_security_group" "my_webserver_group" {
  name        = "my_webserver_group"
  description = "My first SecurityGroup"

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
    name  = "my_webserver_group"
    owner = "Harchenko Anastasia"
  }
}
