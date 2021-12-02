#instances 

resource "aws_instance" "webserver1-project10" {
  ami           = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project10-sg.id]
  subnet_id = aws_subnet.project10-pub-sub1.id
  availability_zone = "eu-west-2a"
  user_data = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}
resource "aws_instance" "webserver2-project10" {
  ami           = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project10-sg.id]
  subnet_id = aws_subnet.project10-pub-sub2.id
  availability_zone = "eu-west-2b"
  user_data = file("install_apache.sh")

  tags = {
    Name = "HelloWorld-user"
  }
}

resource "aws_instance" "webserver3-project10" {
  ami           = "ami-0fc15d50d39e4503c"
  instance_type = "t2.micro"
  vpc_security_group_ids = [aws_security_group.project10-sg.id]
  subnet_id = aws_subnet.project10-pub-sub3.id
  availability_zone = "eu-west-2c"
  user_data = file("install_apache.sh")

  tags = {
    Name = "HelloWorld"
  }
}

