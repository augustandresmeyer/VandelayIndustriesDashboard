output "api_endpoint" {
    value       = aws_apigatewayv2_api.http_api.api_endpoint
    description = "API Gateway endpoint URL"
}

output "lambda_function_name" {
    value       = aws_lambda_function.vandelay_api.function_name
    description = "Lambda function name"
}

output "rds_endpoint" {
    value       = aws_db_instance.vandelay_postgres.endpoint
    description = "RDS PostgreSQL endpoint"
    sensitive   = true
}

