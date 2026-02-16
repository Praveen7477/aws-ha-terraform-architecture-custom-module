output "alb_sg_id" {
  value = aws_security_group.alb.id
}

output "client_sg_id" {
  value = aws_security_group.client.id
}

output "db_sg_id" {
  value = aws_security_group.db_sg.id
}