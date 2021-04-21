resource "aws_cloudwatch_event_rule" "lambda_rule" {
  count               = var.enable ? 1 : 0
  schedule_expression = var.schedule_expression
}

resource "aws_cloudwatch_event_target" "lambda_target" {
  count = var.enable ? 1 : 0
  rule  = aws_cloudwatch_event_rule.lambda_rule[count.index].arn
  arn   = var.lambda_arn
}

resource "aws_lambda_permission" "cloudwatch_permission" {
  count         = var.enable ? 1 : 0
  statement_id  = "AllowExecutionFromCloudWatch"
  action        = "lambda:InvokeFunction"
  function_name = var.lambda_arn
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.lambda_rule[count.index].arn
}