provider "aws" {
  region  = "us-east-1"
  profile = "dev"
}

data "aws_region" "current" {
}

data "aws_caller_identity" "current" {
}

module "lambda_schedule" {
  source        = "../../../"
  function_name = "my-lambda-scheduled"
  description   = "My lambda function scheduled"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  
  schedule_expression = "rate(1 minute)"

  source_path = "../src/lambda/python-lambda-scheduled"

  tags = {
    Name = "my-lambda-scheduled"
  }
}
