resource "aws_sns_topic" "week12-sns" {
  name = "week12-sns"
  kms_master_key_id = "alias/aws/sns"
}

resource "aws_sns_topic_subscription" "week12-ssn-topic" {
  topic_arn = aws_sns_topic.week12-sns.arn
  protocol  = "email"
  endpoint  = "priyapatel1501@gmail.com"
}
