provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_cloudwatch_metric_alarm" "choonyee_info_count_breach" {
  alarm_name          = "choonyee-info-count-breach"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "choonyee-info-count"  # Replace with your actual metric name
  namespace           = "CustomNamespace"  # Replace with your actual namespace
  period              = 60  # 1 minute period (in seconds)
  statistic           = "Sum"
  threshold           = 10
  alarm_description   = "Alarm when choonyee-info-count breaches threshold of 10"
  actions_enabled     = true
 
 alarm_actions       = [aws_sns_topic.alarm_notification.arn]
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.choonyee_info_count_breach.alarm_name
}

resource "aws_sns_topic" "alarm_notification" {
  name = "choonyee-info-count-alarm-notifications"
}

output "alarm_name" {
  value = aws_cloudwatch_metric_alarm.choonyee_info_count_breach.alarm_name
}
