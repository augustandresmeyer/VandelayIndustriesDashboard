resource "aws_iam_role" "lambda_exec" {
    name = "vandelay_lambda_exec_role"
    description = "Execution role for Vandelay API Lambda"

    assume_role_policy = jsonencode({
        Version = "2012-10-17",
        Statement = [{
            Effect = "Allow",
            Principal = {
                Service = "lambda.amazonaws.com"
            },
            Action = "sts:AssumeRole"
        }]
    })
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution" {
    role = aws_iam_role.lambda_exec.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "aws_iam_policy_document" "lambda_read_db_secret" {
    statement {
        actions = ["secretsmanager:GetSecretValue"]
        resources = [aws_secretsmanager_secret.db_credentials.arn]
    }
}

resource "aws_iam_policy" "lambda_read_db_secret" {
    name = "vandelay-lambda-read-db-secret"
    description = "Allow Lambda to read DB creds from Secrets manager"
    policy = data.aws_iam_policy_document.lambda_read_db_secret.json
}

resource "aws_iam_role_policy_attachment" "lambda_read_db_secret" {
    role = aws_iam_role.lambda_exec.name
    policy_arn = aws_iam_policy.lambda_read_db_secret.arn
}

resource "aws_iam_role_policy_attachment" "lambda_vpc_access" {
    role = aws_iam_role.lambda_exec.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaVPCAccessExecutionRole"
}