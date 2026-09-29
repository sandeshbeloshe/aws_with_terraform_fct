output "public_ip" {
  description = "This is for the aws ec2 instance public ip"
  value = aws_instance.example.public_ip
}

output "private_ip" {
  description = "This is for the aws ec2 instance private ip"
  value = aws_instance.example.private_ip
}

output "public_dns" {
  description = "This is for the aws ec2 instance public dns"
  value = aws_instance.example.public_dns
}

output "private_dns" {
  description = "This is for the aws ec2 instance private dns"
  value = aws_instance.example.private_dns
}

output "instance_id" {
 description = "This is for the aws ec2 instance id"
 value = aws_instance.example.id
}
