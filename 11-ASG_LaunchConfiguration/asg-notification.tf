#Random resource provider
resource "random_pet" "this" {
  length = 2
}

#SNS Topic
resource "aws_sns_topic" "mytopic" {
  name = "aws_terraform_sns_topic-${random_pet.this.id}"
}


#Notification
resource "aws_autoscaling_notification" "terraformasg_notifications" {
  group_names = [module.autoscaling.autoscaling_group_name]

  notifications = [
    "autoscaling:EC2_INSTANCE_LAUNCH",
    "autoscaling:EC2_INSTANCE_TERMINATE",
    "autoscaling:EC2_INSTANCE_LAUNCH_ERROR",
    "autoscaling:EC2_INSTANCE_TERMINATE_ERROR",
  ]

  topic_arn = aws_sns_topic.mytopic.arn
}
#SNS Subscription
resource "aws_sns_topic_subscription" "my_terraform_sns_subscription" {
  topic_arn = aws_sns_topic.mytopic.arn
  protocol  = "email"
  endpoint  = "divyanshjswl@gmail.com"
}