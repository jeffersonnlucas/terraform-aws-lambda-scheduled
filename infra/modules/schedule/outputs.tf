output "cloudwatch_event_rule_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Event Rule"
  value       = element(concat(aws_cloudwatch_event_rule.lambda_rule.*.arn, [""]), 0)
}

output "cloudwatch_event_target_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Event Target"
  value       = element(concat(aws_cloudwatch_event_target.lambda_target.*.arn, [""]), 0)
}