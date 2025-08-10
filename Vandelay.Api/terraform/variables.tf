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

variable "private_subnet_az1" {
    description = "AZ for the first private subnet"
    type = string
}

variable "private_subnet_az2" {
    description = "AZ for seceond private subnet"
    type = string
}

variable "private_subnet_cidr1" {
    description = "CIDR block for first private subnet"
    type = string
}

variable "private_subnet_cidr2" {
    description = "CIDR block for second private subnet"
    type = string
}