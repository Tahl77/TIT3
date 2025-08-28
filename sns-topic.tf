resource "aws_sns_topic" "alarm_notifications" {
  #subscribe with email to receive notifications
  name = "AlarmNotifications"
}
