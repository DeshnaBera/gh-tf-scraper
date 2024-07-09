region = "us-east-1"
environment = "dev"

lambda_functions = [
    {
        function_name       = "my-lambda-dev-1"
        handler             = "lambda_hello.lambda_handler"
        runtime             = "python3.10"
        timeout             = 30
        environment_variables = {
            STAGE = "dev"
        }
        s3_bucket_name      = "lambda-upload0620"
        s3_key              = "lambda_hello.zip"
    },
    {
        function_name       = "my-lambda-dev-2"
        handler             = "lambda.lambda_handler"
        runtime             = "python3.10"
        timeout             = 60
        environment_variables = {
            STAGE = "dev"
        }
        s3_bucket_name      = "lambda-upload0620"
        s3_key              = "lambda.zip"
    }
]