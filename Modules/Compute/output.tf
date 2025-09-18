output "public_instance_id" {
  value = aws_instance.public_vm.id
}

output "public_instance_ip" {
  value = aws_instance.public_vm.public_ip
}

output "private_instance_id" {
  value = aws_instance.private_vm.id
}

output "public_sg_id" {
  value = aws_security_group.public_sg.id
}
