resource "aws_launch_template" "ecs_launch_template" {
  name_prefix   = "ecs-launch-template"
  image_id      = "ami-0b0ea68c435eb488d" # Update this to the latest Amazon ECS-Optimized AMI for your region
  instance_type = "t2.micro"
  key_name      = "your-ssh-key" # Replace with your key pair name
  user_data = base64encode(<<EOF
#!/bin/bash
echo ECS_CLUSTER=${aws_ecs_cluster.my_ecs_cluster.name} >> /etc/ecs/ecs.config
EOF
  )

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.ecs_sg.id]
  }

  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = "ECS Instance"
    }
  }
}
