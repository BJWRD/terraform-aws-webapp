project_name = [
  "bradwhitcomb.com"
]

environment = [
  "prod"
]

vpc_cidr = "10.0.0.0/16"

az_public_subnet = {
  "eu-west-2a" : "10.0.0.0/24"
}

az_private_subnet = {
  "eu-west-2a" : "10.0.101.0/24",
}

availability_zones = [
  "eu-west-2a"
]

destination_cidr_block = [
  "0.0.0.0/0"
]

subnet_id = [
  "aws_subnet.public_subnet.id"
]

aws_subnet_public_subnet = [
  "aws_subnet.public_subnet.id"
]

aws_subnet_private_subnet = [
  "aws_subnet.private_subnet.id"
]

load_balancer_type = [
  "application"
]

security_group_alb_app_http = [
  "aws_security_group.alb_app_http.id"
]

app_alb_lb = [
  "app-alb-lb"
]

app_target_group = [
  "app-target-group"
]

app_autoscaling_group = [
  "app-autoscaling-group"
]
