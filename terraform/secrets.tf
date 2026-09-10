resource "aws_secretsmanager_secret" "mongodb" {
  name = "${local.name}/mongodb"
}

# add credentials through console after resource creation