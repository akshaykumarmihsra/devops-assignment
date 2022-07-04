provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAWGFGW5FOHTYKWPMJ"
  secret_key = "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"
}

provider "archive" {}

data "archive_file" "zip" {
  type        = "zip"
  source_file = "hello_lambda.py"
  output_path = "hello_lambda.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "hello_lambda"

  filename         = "${data.archive_file.zip.output_path}"
  source_code_hash = "${data.archive_file.zip.output_base64sha256}"

  
  handler = "hello_lambda.lambda_handler"
  runtime = "python3.6"

  environment {
    variables = {
      greeting = "Hello"
    }
  }
}