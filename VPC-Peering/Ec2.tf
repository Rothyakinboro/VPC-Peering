# Amazon linux instance in us and canada, for connection and testing

resource "aws_instance" "canada-ec2" {
  ami                    = "ami-01cec95f547f7e19d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.canada-vpc-subnet.id
  vpc_security_group_ids = ["aws_security_group.canada-vpc-SG.id"]

  tags = {
    Name = "VPC-Peering-Canada"
  }
}

resource "aws_instance" "us-ec2" {
  ami                    = "ami-0427090fd1714168b"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.us-vpc-subnet.id
  vpc_security_group_ids = ["aws_security_group.us-vpc-SG.id"]

  tags = {
    Name = "VPC-Peering-US"
  }
}
