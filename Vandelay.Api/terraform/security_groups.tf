resource "aws_security_group" "lambda_sg" {
    name = "vandelay-lambda-sg"
    description = "Lambda egress to RDS"
    vpc_id = var.vpc_id
    
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group_rule" "rds_from_lambda" {
    type = "ingress"
    from_port = var.db_port
    to_port = var.db_port
    protocol = "tcp"
    security_group_id = var.rds_sg_id
    source_security_group_id = aws_security_group.lambda_sg.id
    description = "Allow Lambda SG to reach RDS on ${var.db_port}"
}