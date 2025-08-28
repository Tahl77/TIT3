resource "aws_cloudwatch_metric_alarm" "high_cpu_web" {
  alarm_name          = "HighCPUUtilizationWeb"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 5
  alarm_description   = "Monitor CPU utilization for Web ASG"
  dimensions = {
    AutoScalingGroupName = aws_autoscaling_group.asg-web.name
  }
    alarm_actions       = [aws_sns_topic.alarm_notifications.arn]
}