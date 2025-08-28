resource "aws_cloudwatch_metric_alarm" "high_cpu_app" {
  alarm_name          = "HighCPUUtilizationApp"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 20          # Low threshold for demo
  alarm_description   = "Demo: Monitor CPU utilization for App ASG"

  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-app.name
  }
    alarm_actions        = [aws_sns_topic.alarm_notifications.arn]
}
