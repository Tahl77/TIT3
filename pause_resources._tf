# Pause web ASG
resource "aws_autoscaling_group" "asg-web-pause" {
  name                = aws_autoscaling_group.asg-web.name
  desired_capacity    = 0
  max_size            = 0
  min_size            = 0
  launch_template {
    id      = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }

  vpc_zone_identifier = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]

  # Prevent recreation
  lifecycle {
    ignore_changes = [launch_template, vpc_zone_identifier]
  }
}

# Pause app ASG
resource "aws_autoscaling_group" "asg-app-pause" {
  name                = aws_autoscaling_group.asg-app.name
  desired_capacity    = 0
  max_size            = 0
  min_size            = 0
  launch_template {
    id      = aws_launch_template.template-app.id
    version = aws_launch_template.template-app.latest_version
  }

  vpc_zone_identifier = [aws_subnet.app-subnet1.id, aws_subnet.app-subnet2.id]

  lifecycle {
    ignore_changes = [launch_template, vpc_zone_identifier]
  }
}
