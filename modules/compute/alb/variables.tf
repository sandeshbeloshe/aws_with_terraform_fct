variable "environment" {
  type = string
}

variable "project_name" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {
  type = string
}

variable "target_group_arn" {
  type = string
}

variable "enable_deletion_protection" {
  type    = bool
  default = false
}

variable "idle_timeout" {
  type    = number
  default = 60
}

variable "acm_certificate_arn" {
  type = string
}

variable "aws_region" {
  type = string
}
