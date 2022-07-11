output "publicip"{
    value=aws_instance.example.public_ip
    description = "public ip of instance"
    depends_on = [
      aws_security_group.instance
    ]
}