resource "aws_lambda_function" "playground_lambda" {
  function_name     = "playground_lambda"
  filename          = "${path.module}/playground_lambda.zip"
  handler           = "playground_lambda.handler"
  runtime           = "python3.6"
  role              = "${aws_iam_role.playground_lambda_role.arn}"
  memory_size       = 128
  source_code_hash  = "${data.archive_file.playground_lambda.output_base64sha256}"

  environment {
    variables = {
      lambda_variable = "${var.lambda_variable}"
    }
  }
}


data "archive_file" "playground_lambda" {
  type        = "zip"
  source_file = "${path.module}/playground_lambda.py"
  output_path = "${path.module}/playground_lambda.zip"
}