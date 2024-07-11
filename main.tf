terraform {
  backend "s3" {
    bucket = "tf-state-bucket0907"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "TfState"
  }
}

provider "aws" {
  region = var.region
}
 
module "lambda" {
  source              = "./modules/lambdas"
  environment         = var.environment
  region              = var.region
}