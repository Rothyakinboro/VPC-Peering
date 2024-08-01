# Two VPCs: Canada and United States

resource "aws_vpc" "canada-vpc" {
  cidr_block = "10.0.0.0/18"
  provider = aws.ca_central_1

  tags = {
    Name = "VPC peering Canada"
  }
}

resource "aws_vpc" "us-vpc" {
  cidr_block = "10.0.0.0/24"
  provider = aws.us_east_1

  tags = {
    Name = "VPC Peering United States"
  }
}