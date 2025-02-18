resource "aws_ecs_task_definition" "my_task" {
  family                   = "nodejs-app-task"
  requires_compatibilities = ["EC2"]  # Changed from Fargate to EC2
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  cpu                      = "256"
  memory                   = "512"
  network_mode             = "bridge"  # Change from "awsvpc" to "bridge" for EC2

  container_definitions = jsonencode([
    {
      name      = "nodejs-app-container"
      image     = "${aws_ecr_repository.my_repo.repository_url}:latest"
      essential = true
      portMappings = [
        {
          containerPort = 3000
          hostPort      = 0  # Dynamic host port assignment
        }
      ]
    }
  ])
}
