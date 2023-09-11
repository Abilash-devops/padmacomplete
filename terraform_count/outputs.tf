output "aws_instance_privateip" {
    value = [aws_instance.project[*].private_ip]  
}

output "aws_instance_publicip" {
    value = [aws_instance.project[*].public_ip]  
}