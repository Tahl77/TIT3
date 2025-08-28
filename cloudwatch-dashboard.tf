resource "aws_cloudwatch_dashboard" "multi_asg_dashboard" {
  dashboard_name = "MultiTierDashboard"
  dashboard_body = jsonencode({
    widgets = [
      {
        type = "metric",
        x = 0,
        y = 0,
        width = 24,
        height = 6,
        properties = {
          metrics = [
            ["AWS/EC2", "CPUUtilization", "AutoScalingGroupName", aws_autoscaling_group.asg-web.name, { "label" = "Web ASG" }],
            ["AWS/EC2", "CPUUtilization", "AutoScalingGroupName", aws_autoscaling_group.asg-app.name, { "label" = "App ASG" }]
          ]
          period = 60
          stat = "Average"
          region = "eu-north-1"
        }
      }
    ]
  })
}
