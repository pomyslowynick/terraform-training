terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {

    bucket = "terraform-up-and-running-state-unique-number-122"
    key    = "workspaces-example/terraform.tfstate"
    region = "us-east-2"
    
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "example" {
  ami           = "ami-0fb653ca2d3203ac1"

  instance_type = terraform.workspace == "default" ? "t2.medium" : "t2.micro"

}

