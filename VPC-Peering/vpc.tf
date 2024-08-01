# Two VPCs: Canada and United States

resource "aws_vpc" "canada-vpc" {
  cidr_block = "10.0.0.0/18"

  tags = {
    Name = "VPC peering Canada"
  }
}

resource "aws_vpc" "us-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "VPC Peering United States"
  }
}