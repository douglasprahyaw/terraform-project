variable "vpc_id" { type = string }
variable "public_subnet" { type = string }
variable "private_subnet" { type = string }
variable "key_name" { type = string }
variable "ami" {
  type    = string
  default = "ami-08982f1c5bf93d976" # Amazon Linux 2
}
variable "public_instance_type" {
  type    = string
  default = "t3.micro"
}
variable "private_instance_type" {
  type    = string
  default = "t3.micro"
}
