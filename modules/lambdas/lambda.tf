resource "aws_lambda_function" "lambda" {
  for_each          = { for lambda in var.lambda_functions : lambda.function_name => lambda }
  function_name     = each.value.function_name
  s3_bucket         = each.value.s3_bucket_name
  s3_key            = each.value.s3_key
  handler           = each.value.handler
  runtime           = each.value.runtime
  timeout           = each.value.timeout
  role              = aws_iam_role.lambda_role[each.key].arn
  environment {
    variables = each.value.environment_variables
  }
}
resource "aws_iam_role" "lambda_role" {
  for_each = { for lambda in var.lambda_functions : lambda.function_name => lambda }
  name = "${each.value.function_name}_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}