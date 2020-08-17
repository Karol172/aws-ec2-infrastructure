output "ipAddr_public" {
  value = aws_instance.ec2.public_ip
}

output "ipAddr_private" {
  value = aws_instance.ec2.private_ip
}
