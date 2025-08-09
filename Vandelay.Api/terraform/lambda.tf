resource "aws_lambda_function" "vandelay_api" {
    function_name = var.lambda_function_name
    role = aws_iam_role.lambda_exec.arn
    handler = "Vandelay.Api"

    runtime = "dotnet8"
    timeout = 10

    filename = "${path.module}/../bin/Release/net8.0/vandelay-api.zip"
    source_code_hash = filebase64sha256("${path.module}/../bin/Release/net8.0/vandelay-api.zip")

    vpc_config {
        subnet_ids = var.private_subnet_ids
        security_group_ids = [aws_security_group.lambda_sg.id]
    }

    environment {
        variables = {
            ASPNETCORE_ENVIRONMENT = "Production"
            DB_HOST = "vandelay-db-1.c29i26um01bh.us-east-1.rds.amazonaws.com"
            DB_PORT = 5432
            DB_NAME = "vandelay-db-1"
        }
    }
}