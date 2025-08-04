resource "aws_lambda_function" "vandelay_api" {
    function_name = var.lambda_function_name
    role = aws_iam_role.lambda_exec.arn
    handler = "Vandelay.Api"

    runtime = "dotnet8"
    timeout = 10

    filename = "${path.module}/../bin/Release/net8.0/vandelay-api.zip"
    source_code_hash = filebase64sha256("${path.module}/../bin/Release/net8.0/vandelay-api.zip")

    environment {
        variables = {
            ASPNETCORE_ENVIRONMENT = "Production"
        }
    }
}