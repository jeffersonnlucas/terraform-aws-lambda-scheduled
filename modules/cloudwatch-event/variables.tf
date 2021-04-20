variable "enable" {
  description = "Enable the use of the module."
  type        = bool
  default     = false
}

variable "lambda_arn" {
  description = "The Amazon Resource Name (ARN) identifying the Lambda Function triggered by CloudWatch"
}

variable "schedule_expression" {
  description = "The scheduling expression. For example, cron (0 20 * *? *) Or fee (5 minutes). schedule_expression is mandatory if you have enabled this module."
}