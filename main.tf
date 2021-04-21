module "lambda_scheduler" {
  source        = "terraform-aws-modules/lambda/aws"
  function_name = var.function_name
  description   = var.description
  handler       = var.handler
  runtime       = var.runtime
  publish = true
  kms_key_arn = var.kms_key_arn

  source_path = var.source_path

  allowed_triggers = {
    ScheduleLambdaRule = {
      principal = "events.amazonaws.com"
      source_arn = aws_cloudwatch_event_rule.schedule.arn
    }
  }

  tags = var.tags

  vpc_security_group_ids =  var.vpc_security_group_ids
  vpc_subnet_ids         =  var.vpc_subnet_ids
}

resource "aws_cloudwatch_event_rule" "schedule" {
  name          = "LambdaScheduleEvent"
  description   = format("Schedule Event Trigger %s", var.function_name)
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "schedule_lambda_function" {
  rule = aws_cloudwatch_event_rule.schedule.name
  arn  = module.lambda_scheduler.this_lambda_function_arn
}