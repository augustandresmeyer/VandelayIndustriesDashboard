resource "aws_secretsmanager_secret" "db_credentials" {
    name = "vandelay/db-credentials"
    description = "DB username and password for Vandelay DB 1 PostgresQL"
}