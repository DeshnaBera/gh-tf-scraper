terraform {
  backend "s3" {
    bucket = "tf-state-bucket0207"
    key    = "terraform.tfstate"
    region = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}
 
resource "aws_lambda_function" "example" {
  function_name = "hello"
 
  # The bucket name as created earlier with "aws s3api create-bucket"
  s3_bucket = var.s3_bucket
  s3_key    = var.s3_key
 
  handler = var.lambda_handler
  runtime = "python3.10"
 
  role = aws_iam_role.iam_for_lambda.arn
}
 
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
 
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}