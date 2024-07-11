variable "lambda_functions" {
    description = "List of Lambda function configurations"
    type = list(object({
        function_name       = string
        handler             = string
        runtime             = string
        timeout             = number
        environment_variables = map(string)
        s3_bucket_name      = string
        s3_key              = string
    }))
}

variable "environment" {
    description = "The Environment to deploy to"
    type = string
}

variable "region" {
    description = "The AWS region to deploy to"
    type = string
}
