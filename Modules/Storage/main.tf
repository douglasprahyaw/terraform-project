resource "aws_s3_bucket" "assets" {
  bucket = var.bucket_name
  acl    = "private"
  tags   = { Name = "assets-bucket" }
}
