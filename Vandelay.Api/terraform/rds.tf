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
    name = "vandelay-rds-subnet-group"
    subnet_ids = local.private_subnet_ids
    tags = {
        Name = "vandelay-rds-subnet-group"
    }
}

resource "aws_db_instance" "vandelay_postgres" {
    identifier = "vandelay-db-1"
    engine = "postgres"
    engine_version = "17.4"
    instance_class = "db.t4g.micro"
    allocated_storage = 20
    storage_type = "gp2"

    manage_master_user_password = true

    db_subnet_group_name = aws_db_subnet_group.vandelay_rds_subnet_group.name
    vpc_security_group_ids = [aws_security_group.rds_sg.id]

    skip_final_snapshot = true

    tags = {
        Name = "vandelay-postgres-db"
    }
}
