variable "lambda_function_name" {
    default = "vandelay-api"
}

variable "api_name" {
    default = "vandelay-http-api"
}

variable "vpc_id" {
    type = string
}

variable "rds_sg_id" {
    type = string
    description = "RDS Security Group ID"
}

variable "db_port" {
    type = number
    default = 5432
}

variable "private_subnet_ids" {
    description = "Private subnets where the Lambda ENIs will live"
    type = list(string)
}

