output "lambda_event_rule_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Event Rule"
  value = [aws_cloudwatch_event_rule.lambda_rule.*.arn]
}

output "lambda_event_rule_name" {
  description = "The name of event rule"
  value = [aws_cloudwatch_event_rule.lambda_rule.*.name]
}

output "aws_cloudwatch_event_target_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Event Target"
  value = [aws_cloudwatch_event_target.lambda_target.*.arn]
}

output "aws_cloudwatch_event_target_name" {
  description = "The name of event target"
  value = [aws_cloudwatch_event_target.lambda_target.*.name]
}

output "aws_lambda_permission_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Lambda Permission"
  value = [aws_lambda_permission.cloudwatch_permission.*.arn]
}

output "aws_lambda_permission_name" {
  description = "The name of lambda permission"
  value = [aws_lambda_permission.cloudwatch_permission.*.name]
}