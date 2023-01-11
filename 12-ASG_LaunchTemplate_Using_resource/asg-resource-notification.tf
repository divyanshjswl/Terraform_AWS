#SNS Topic
resource "aws_sns_topic" "asg_sns" {
  name = "myasgsnstopic-${random_pet.test.id}"
}
#SNS Subscription
resource "aws_sns_topic_subscription" "user_updates_sqs_target" {
  topic_arn = aws_sns_topic.asg_sns.arn
  protocol  = "email"
  endpoint  = "divyanshjswl@gmail.com"
}
#ASG Notification
resource "aws_autoscaling_notification" "myasg_notifications" {
  group_names = [aws_autoscaling_group.terraform_asg.id]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.asg_sns.arn
}