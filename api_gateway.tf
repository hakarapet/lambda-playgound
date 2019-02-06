resource "aws_api_gateway_rest_api" "playground_api_gateway" {
  name        = "Playground Gateway"
  description = "This is my API for demonstration purposes"
}

resource "aws_api_gateway_resource" "playground_api_gateway_resource" {
  rest_api_id = "${aws_api_gateway_rest_api.playground_api_gateway.id}"
  parent_id   = "${aws_api_gateway_rest_api.playground_api_gateway.root_resource_id}"
  path_part   = "playgound"
}

resource "aws_api_gateway_method" "playground_api_gateway_method" {
  rest_api_id       = "${aws_api_gateway_rest_api.playground_api_gateway.id}"
  resource_id       = "${aws_api_gateway_resource.playground_api_gateway_resource.id}"
  http_method       = "POST"
  authorization     = "NONE"
  api_key_required  = false
}

resource "aws_api_gateway_integration" "playground_api_gateway_integration" {
  rest_api_id = "${aws_api_gateway_rest_api.playground_api_gateway.id}"
  resource_id = "${aws_api_gateway_method.playground_api_gateway_method.resource_id}"
  http_method = "${aws_api_gateway_method.playground_api_gateway_method.http_method}"

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = "${aws_lambda_function.playground_lambda.invoke_arn}"
}

resource "aws_api_gateway_deployment" "playground_api_gateway_deployment" {
  depends_on  = ["aws_api_gateway_integration.playground_api_gateway_integration"]

  rest_api_id = "${aws_api_gateway_rest_api.playground_api_gateway.id}"
  stage_name  = "playground"
}