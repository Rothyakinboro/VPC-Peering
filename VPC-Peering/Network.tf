# This contains IGW, Route Table Association, Route configuration and VPC Peering Connection. This is for Canada and United States VPC
# IGW: To open subnet to public
# Route Table Association: To link IGW to VPC
# Route Configuration: To set VPC peering, and Cidr Block

resource "aws_internet_gateway" "canada-vpc-IGW" {
  vpc_id = aws_vpc.canada-vpc.id
  provider = aws.ca_central_1
}

resource "aws_internet_gateway" "us-vpc-IGW" {
  vpc_id = aws_vpc.us-vpc.id
  provider = aws.us_east_1
}

resource "aws_route_table_association" "canada-rt-association" {
  subnet_id = aws_subnet.canada-vpc-subnet.id
  route_table_id = aws_vpc.canada-vpc.main_route_table_id
  provider = aws.ca_central_1
}

resource "aws_route" "canada-rt" {
  route_table_id = aws_vpc.canada-vpc.main_route_table_id
  #destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.canada-vpc-IGW.id
  vpc_peering_connection_id = aws_vpc_peering_connection.peer-canada-us.id
  destination_cidr_block = aws_vpc.us-vpc.cidr_block
  provider = aws.ca_central_1
}

resource "aws_route_table_association" "us-rt-association" {
  subnet_id = aws_subnet.us-vpc-subnet.id
  route_table_id = aws_vpc.us-vpc.main_route_table_id
  provider = aws.us_east_1
}

resource "aws_route" "us-rt" {
  route_table_id = "aws_vpc.us-vpc.main_route_table_id"
  #destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.us-vpc-IGW.id
  vpc_peering_connection_id = aws_vpc_peering_connection.peer-canada-us.id
  destination_cidr_block = aws_vpc.canada-vpc.cidr_block
  provider = aws.us_east_1

}

# VPC Peering Connection

resource "aws_vpc_peering_connection" "peer-canada-us" {
  #peer_region = aws.ca_central_1
  vpc_id      = aws_vpc.canada-vpc.id
  peer_vpc_id = aws_vpc.us-vpc.id
  #peer_region = aws.us_east_1
  auto_accept = true

  tags = {
    Name = "canada-us-peering"
  }
}
