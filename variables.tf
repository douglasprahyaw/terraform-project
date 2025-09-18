variable "region" {
  type    = string
  default = "us-east-1"
}

variable "key_name" {
  type        = string
  description = "SSH key pair name"
}

variable "bucket_name" {
  type        = string
  description = "Name for S3 bucket"
}
