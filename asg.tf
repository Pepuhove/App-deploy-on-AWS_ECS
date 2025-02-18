resource "aws_autoscaling_group" "ecs_asg" {
  desired_capacity     = 1
  max_size            = 2
  min_size            = 1
  vpc_zone_identifier = aws_subnet.public.*.id
  launch_template {
    id      = aws_launch_template.ecs_launch_template.id
    version = "$Latest"
  }
}
