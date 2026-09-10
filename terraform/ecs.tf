resource "aws_ecs_cluster" "main" {
  name = "${local.name}-cluster"
}

resource "aws_ecs_task_definition" "app" {
  family                   = local.name
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]

  cpu    = var.fargate_cpu
  memory = var.fargate_memory

  execution_role_arn = aws_iam_role.ecs_execution.arn

  container_definitions = jsonencode([
    {
      name      = var.project_name
      image     = var.ecr_image_uri
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.container_port
          protocol      = "tcp"
        }
      ]

      secrets = [
        {
          name      = "MONGO_URI"
          valueFrom = "${aws_secretsmanager_secret.mongodb.arn}:MONGO_URI::"
        },
        {
          name      = "MONGO_USERNAME"
          valueFrom = "${aws_secretsmanager_secret.mongodb.arn}:MONGO_USERNAME::"
        },
        {
          name      = "MONGO_PASSWORD"
          valueFrom = "${aws_secretsmanager_secret.mongodb.arn}:MONGO_PASSWORD::"
        }
      ]
    }
  ])
}

resource "aws_ecs_service" "app" {
  name            = "${local.name}-service"
  cluster         = aws_ecs_cluster.main.id
  task_definition = aws_ecs_task_definition.app.arn

  desired_count = var.desired_count

  launch_type = "FARGATE"

  network_configuration {
    subnets = aws_subnet.public[*].id

    security_groups = [
      aws_security_group.ecs.id
    ]

    assign_public_ip = true
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app.arn
    container_name   = var.project_name
    container_port   = var.container_port
  }

  depends_on = [
    aws_lb_listener.http
  ]
}
