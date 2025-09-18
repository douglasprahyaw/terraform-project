output "public_instance_ip" {
  value = module.compute.public_instance_ip
}

output "private_instance_id" {
  value = module.compute.private_instance_id
}

output "load_balancer_dns" {
  value = module.lb.lb_dns
}

output "s3_bucket_name" {
  value = module.storage.bucket_name
}
