provider "aws" {
    region = "eu-central-1"
    access_key = "AKIA47CRXIRF4VUOVEIJ"
    secret_key = "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"
}

resource "aws_instance" "my_app_server" {
    ami = "ami-04e601abe3e1a910f"
    instance_type = "t2.micro"
    key_name = "TokAnsiAman"
    security_groups = ["default"]
    user_data = <<-EOF
    #!/bin/bash
    sudo apt-get update -y
    sudo apt-get install -y docker.io
    sudo systemctl enable docker
    sudo systemctl start docker
    sudo usermod -aG docker ubuntu
    sudo docker run -d -p 80:80 nginx
    EOF
tags = {Name = "SampleForPracticalTask"}
}

output "instance_public_ip" {
    description = "Public IP address of the EC2 instance"
    value = aws_instance.my_app_server.public_ip
}