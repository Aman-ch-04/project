provider "aws" {
  region     = "us-east-1"  # Change if your region is different
  access_key = "write your own"
  secret_key = "write your own"
}

resource "aws_instance" "devops-project" {
  ami           = "ami-020cba7c55df1f615" # Ubuntu 22.04 in ap-south-1
  instance_type = "t2.micro"
  key_name      = "terr"   # Replace with your actual key name

  user_data = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y docker.io git unzip

              systemctl start docker
              systemctl enable docker

              # Install Docker Compose
              curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m>              chmod +x /usr/local/bin/docker-compose

              # Clone your repo (Replace with your repo URL)
              git clone https://github.com/Aman-ch-04/project.git /home/ubuntu/project
                          cd /home/ubuntu/project
              docker build -t my-apache-website .
              docker run -d -p 80:80 my-apache-website
              EOF

  tags = {
    Name = "DevOps-Automated-Instance"
  }
}
