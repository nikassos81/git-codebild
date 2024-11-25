provider "aws" {
region = "eu-central-1"
profile = "Nikolaos"
  
}


terraform {
  backend "s3" {
    bucket = "nikolaos-souvlakia-git-codebuilt-terraform"
    key = "terraform.tfstate"
    region = "eu-central-1"
    profile = "Nikolaos"
    
  }
}



module "vpc" {

  source  = "terraform-aws-modules/vpc/aws"
  version = "5.16.0"

  name = "Nikolaos-VPC"
  cidr = "10.0.0.0/16"
  azs             = ["eu-central-1a"]
  private_subnets = ["10.0.1.0/24"]
  public_subnets  = ["10.0.101.0/24"]

  public_subnet_tags = {
    Name = "Nikolaos-Public-Subnet"
  }

   private_subnet_tags = {
    Name = "Nikolaos-Private-Subnet"
  }
  
  tags = {
    Owner = "Nikolaos"
  }

}