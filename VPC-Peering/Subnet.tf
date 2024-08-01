# Subnet needed to provision Routes, IGW and Ec2 instance for Testing. The subnets are for the VPCs in Canada and United States

resource "aws_subnet" "canada-vpc-subnet" {
  provider = aws.ca_central_1
  vpc_id = "aws_vpc.canada-vpc.id"
  cidr_block = "10.0.0.0/18"
  availability_zone = "ca-central-1a"
}

resource "aws_subnet" "us-vpc-subnet" {
  provider = aws.us_east_1
  vpc_id = "aws_vpc.us-vpc.id"
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"
}