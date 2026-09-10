output "alb_dns_name" {
  description = "Application Load Balancer DNS name"
  value       = aws_lb.main.dns_name
}

output "application_url" {
  description = "Application URL"
  value       = "http://${aws_lb.main.dns_name}"
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "ecs_cluster_name" {
  description = "ECS cluster name"
  value       = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  description = "ECS service name"
  value       = aws_ecs_service.app.name
}

output "task_definition_family" {
  description = "ECS task definition family"
  value       = aws_ecs_task_definition.app.family
}

output "github_cd_role_arn" {
  description = "IAM role ARN used by GitHub Actions CD"
  value       = aws_iam_role.github_cd.arn
}

output "mongodb_secret_arn" {
  description = "MongoDB Secrets Manager secret ARN"
  value       = aws_secretsmanager_secret.mongodb.arn
}
