resource "aws_ecs_service" "my_ecs_service" {
  name            = "nodejs-app-service"
  cluster         = aws_ecs_cluster.my_ecs_cluster.id
  task_definition = aws_ecs_task_definition.my_task.arn
  desired_count   = 1
  launch_type     = "EC2"  # Change from Fargate to EC2

  load_balancer {
    target_group_arn = aws_lb_target_group.my_target_group.arn
    container_name   = "nodejs-app-container"
    container_port   = 3000
  }
}
