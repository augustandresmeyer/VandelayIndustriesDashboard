resource "aws_security_group" "rds_sg" {
    name_prefix = "vandelay-rds-"
    description = "Security group for RDS PostgreSQL"
    vpc_id = var.vpc_id

    ingress {
        from_port = var.db_port
        to_port = var.db_port
        protocol = "tcp"
        security_groups = [aws_security_group.lambda_sg.id]
        description = "PostgreSQL from Lambda"
    }

    tags = {
        Name = "vandelay-rds-sg"
    }
}

resource "aws_db_subnet_group"  "vandelay_rds_subnet_group" {
    subnet_ids = local.private_subnet_ids
    tags = {
        Name = "vandelay-rds-subnet-group"
    }
}

