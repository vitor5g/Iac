terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-0cf2b4e024cdb6960"
  instance_type = "t2.micro"
    # Grupo de acesso default instancia: sg-04364c6d2cfe06210
    # Grupo de acesso SSH: sg-0bb0e4b4cb61aa250
    # Grupo de acesso HTTP&HTTPS: sg-0df839a1170e8afc0
  vpc_security_group_ids = ["sg-04364c6d2cfe06210","sg-0bb0e4b4cb61aa250", "sg-0df839a1170e8afc0"]
  key_name        = "chave-oregon"
  user_data = <<-EOF
                #!/bin/bash
                cd /home/ubuntu
                echo "<h1>Ola mundo. Feito com Terraform</h1>" > index.html
                sudo nohup busybox httpd -f -p 80 &
                 EOF 
  tags = {
    Name = "teste-aws"
  }
}
