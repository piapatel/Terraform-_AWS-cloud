resource "aws_kms_key" "a" {
  description             = "KMS key 1"
  deletion_window_in_days = 10
}

resource "aws_kms_alias" "a" {
  name          = "alias/week6-kms"
  target_key_id = aws_kms_key.a.key_id
}

