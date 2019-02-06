resource "aws_iam_role" "playground_lambda_role" {
  name = "playground_lambda_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_lambda_permission" "playground_lambda_permission" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = "${aws_lambda_function.playground_lambda.arn}"
  principal     = "apigateway.amazonaws.com"

  source_arn    = "${aws_api_gateway_deployment.playground_api_gateway_deployment.execution_arn}/*/*"
}

resource "aws_iam_role_policy_attachment" "playground_lambda_execution" {
  role        = "${aws_iam_role.playground_lambda_role.name}"
  policy_arn  = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

