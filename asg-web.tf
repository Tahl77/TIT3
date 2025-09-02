resource "aws_autoscaling_group" "asg-web" {
  name                = var.asg-web-name
  desired_capacity    = var.pause ? 0 : 2
  max_size            = var.pause ? 0 : 4
  min_size            = var.pause ? 0 : 1
  target_group_arns   = [aws_lb_target_group.target-group-web.arn]
  health_check_type   = "EC2"
  vpc_zone_identifier = [aws_subnet.web-subnet1.id, aws_subnet.web-subnet2.id]


  launch_template {
    id      = aws_launch_template.template-web.id
    version = aws_launch_template.template-web.latest_version
  }
}