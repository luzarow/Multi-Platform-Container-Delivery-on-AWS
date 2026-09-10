variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-south-1"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "solar-system"
}

variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "container_port" {
  description = "Port exposed by the application container"
  type        = number
  default     = 3000
}

variable "fargate_cpu" {
  description = "Fargate CPU units"
  type        = number
  default     = 512
}

variable "fargate_memory" {
  description = "Fargate memory in MB"
  type        = number
  default     = 1024
}

variable "desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
  default     = 1
}

variable "min_capacity" {
  description = "Minimum ECS tasks"
  type        = number
  default     = 1
}

variable "max_capacity" {
  description = "Maximum ECS tasks"
  type        = number
  default     = 2
}

variable "cpu_target" {
  description = "Target ECS CPU utilization"
  type        = number
  default     = 60
}

variable "ecr_image_uri" {
  description = "Existing ECR image URI"
  type        = string
}

variable "github_repository" {
  description = "GitHub repository in owner/repository format"
  type        = string
  default     = "luzarow/Multi-Platform-Container-Delivery-on-AWS"
}

variable "github_branch" {
  description = "GitHub branch allowed to deploy"
  type        = string
  default     = "main"
}
