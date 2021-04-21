provider "aws" {
  region  = "us-east-1"
  profile = "dev"
}

data "aws_region" "current" {
}

data "aws_caller_identity" "current" {
}

module "lambda" {
  source        = "terraform-aws-modules/lambda/aws"
  function_name = "my-lambda-existing-package-local"
  description   = "My awesome lambda function"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"

  source_path = "../src/lambda/python-lambda-scheduled"

  tags = {
    Name = "my-lambda-existing-package-local"
  }
}

module "schedule_lambda" {
  source              = "./modules/schedule"
  enable              = true
  lambda_arn          = module.lambda.this_lambda_function_arn
  schedule_expression = "rate(1 minute)"
}
