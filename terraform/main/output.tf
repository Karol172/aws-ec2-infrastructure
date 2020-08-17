output "key" {
  value = module.key-pair.rsa-public-key
}

output "ec2_ipAddr" {
  value = module.ec2.ipAddr
}