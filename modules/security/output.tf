output "vpc_security_group_ids" {
  value = aws_security_group.app_instance_sg.id
}

output "security_group_alb_app_http" {
  value = aws_security_group.alb_app_http.id
}
