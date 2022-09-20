resource "aws_instance" "ec2" {
  ami             = "ami-05fa00d4c63e32376"
  instance_type   = "t2.micro"
  user_data       = file("${path.module}/userdata.sh")
  tags = {
    Name = "Ec2demo"
  }
}