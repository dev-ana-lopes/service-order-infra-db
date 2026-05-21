variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "project_name" {
  type    = string
  default = "service-order"
}

variable "environment" {
  type    = string
  default = "production"
}

variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "app_security_group_id" {
  type = string
}

variable "db_name" {
  type    = string
  default = "service_order_db"
}

variable "db_username" {
  type    = string
  default = "service_order_user"
}

variable "db_password" {
  type      = string
  sensitive = true
}

variable "db_instance_class" {
  type    = string
  default = "db.t4g.micro"
}

variable "db_allocated_storage" {
  type    = number
  default = 20
}

variable "db_engine_version" {
  type    = string
  default = "16.10"
}

variable "publicly_accessible" {
  type    = bool
  default = false
}
