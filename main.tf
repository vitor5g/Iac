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
    # Grupo de acesso SSH: sg-0bb0e4b4cb61aa250
    # Grupo de acesso HTTP&HTTPS: sg-0df839a1170e8afc0
  security_groups = ["sg-0bb0e4b4cb61aa250"]
  key_name        = "chave-oregon"
  tags = {
    Name = "Primeira Instancia"
  }
}
