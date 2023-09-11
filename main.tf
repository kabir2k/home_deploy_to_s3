# resource "aws_instance" "project" {
#   ami           = "ami-0f5ee92e2d63afc18" 
#   instance_type = "t2.medium"
#    key_name               = "ka-key"


#   associate_public_ip_address = true

#     user_data = <<-EOF
#  #!/bin/bash
#                   sudo apt update
#                   sudo apt-get install awscli -y
#                   curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
#                   sudo apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
#                   sudo apt update
#                   sudo apt install terraform
                  
#                   sudo apt install openjdk-11-jdk -y
#                   curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo tee /usr/share/keyrings/jenkins-keyring.asc > /dev/null
#                   echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ deb [trusted=yes] https://pkg.jenkins.io/debian binary/| sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
#                  sudo apt update
#                   sudo apt install jenkins -y

#                   EOF

#     }
   

resource "aws_s3_bucket" "example" {
  bucket = "point-loop"

  tags = {
    Name        = "point-loop"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "object" {
  bucket = aws_s3_bucket.example.id
  key    = "main.js"
  source = "/home/user/todo-list/js/main.js"
  etag = filemd5("/home/user/todo-list/js/main.js")
}

resource "aws_s3_object" "object-1" {
  bucket = aws_s3_bucket.example.id
  key    = "index.html"
  source = "/home/user/todo-list/index.html"
  etag = filemd5("/home/user/todo-list/index.html")
}


resource "aws_s3_object" "object-2" {
  bucket = aws_s3_bucket.example.id
  key    = "favicon.ico"
  source = "/home/user/todo-list/img/favicon.ico"
  etag = filemd5("/home/user/todo-list/img/favicon.ico")
}
 

resource "aws_s3_object" "object-3" {
  bucket = aws_s3_bucket.example.id
  key    = "main.css"
  source = "/home/user/todo-list/css/main.css"
  etag = filemd5("/home/user/todo-list/css/main.css")
}
 







