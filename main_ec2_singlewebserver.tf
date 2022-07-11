provider "aws"{
    region="ap-south-1"
}
resource "aws_instance" "example"{
    ami="ami-0cfedf42e63bba657"
    instance_type="t2.micro"
    vpc_security_group_ids=[aws_security_group.instance.id]
    user_data= <<-EOF
    #!/bin/bash
    echo "hello ,lokesh" >index.html
    nohup busybox httpd -f -p ${var.server_port}&
    EOF
    tags={
        Name= "example_server"
    }
}
resource "aws_security_group" "instance"{
    name="aws_exmaple_instance_security_group"
    ingress{
        from_port=var.server_port
        to_port=var.server_port
        protocol="tcp"
        cidr_blocks=["0.0.0.0/0"]
    }
}

