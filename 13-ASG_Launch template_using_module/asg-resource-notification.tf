#SNS Topic
resource "aws_sns_topic" "asg_sns_topic" {
  name = "asg-sns-topic"
}
#SNS Subscription
resource "aws_sns_topic_subscription" "terraform_asg_notification_subs" {
  topic_arn = aws_sns_topic.asg_sns_topic.arn
  protocol  = "email"
  endpoint  = "divyanshjswl@gmail.com"
}

#ASG notification
resource "aws_autoscaling_notification" "asg_notification" {
  group_names = [module.autoscaling.autoscaling_group_id]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.asg_sns_topic.arn
}