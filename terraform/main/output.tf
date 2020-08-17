output "key" {
  value = module.key-pair.rsa-public-key
}

output "ec2_ipAddr" {
  value = module.public_ec2.ipAddr_public
}

output "ec2_ipAddr_private" {
  value = module.protected_ec2.ipAddr_private
}
