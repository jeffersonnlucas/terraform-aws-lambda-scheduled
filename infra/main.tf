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
  function_name = "my-lambda-scheduled"
  description   = "My lambda function scheduled"
  handler       = "index.lambda_handler"
  runtime       = "python3.8"
  publish = true

  source_path = "../src/lambda/python-lambda-scheduled"

  allowed_triggers = {
    ScheduleLambdaRule = {
      principal = "events.amazonaws.com"
      source_arn = aws_cloudwatch_event_rule.schedule.arn
    }
  }

  tags = {
    Name = "my-lambda-scheduled"
  }
}

resource "aws_cloudwatch_event_rule" "schedule" {
  name          = "LambdaScheduleEvent"
  description   = "Lambda Function Schedule Event Trigger"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "schedule_lambda_function" {
  rule = aws_cloudwatch_event_rule.schedule.name
  arn  = module.lambda.this_lambda_function_arn
}
