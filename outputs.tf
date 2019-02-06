output "base_url" {
  value = "${aws_api_gateway_deployment.playground_api_gateway_deployment.invoke_url}"
}
