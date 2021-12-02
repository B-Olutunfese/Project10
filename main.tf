#vpc

resource "aws_vpc" "project10-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "project10-vpc"
  }
}

#public-subnets

resource "aws_subnet" "project10-pub-sub1" {
  vpc_id     = aws_vpc.project10-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"
  map_public_ip_on_launch = true
  tags = {
    Name = "project10-pub-sub1"
  }
}

resource "aws_subnet" "project10-pub-sub2" {
  vpc_id     = aws_vpc.project10-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"
  map_public_ip_on_launch = true
  tags = {
    Name = "project9-pub-sub2"
  }
}

resource "aws_subnet" "project10-pub-sub3" {
  vpc_id     = aws_vpc.project10-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2c"
  map_public_ip_on_launch = true
  tags = {
    Name = "project10-pub-sub3"
  }
}
#private-subnets

resource "aws_subnet" "project10-private-sub1" {
  vpc_id     = aws_vpc.project10-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-2a"
  tags = {
    Name = "project10-private-sub1"
  }
}

resource "aws_subnet" "project10-private-sub2" {
  vpc_id     = aws_vpc.project10-vpc.id
  cidr_block = "10.0.5.0/24"
  availability_zone = "eu-west-2b"
  tags = {
    Name = "project10-private-sub2"
  }
}

resource "aws_subnet" "project10-private-sub3" {
  vpc_id     = aws_vpc.project10-vpc.id
  cidr_block = "10.0.6.0/24"
  availability_zone = "eu-west-2c"
  tags = {
    Name = "project10-private-sub3"
  }
}

#internet gateway

resource "aws_internet_gateway" "project10-igw" {
  vpc_id = aws_vpc.project10-vpc.id

  tags = {
    Name = "project10-igw"
  }
}

#route

resource "aws_route" "project10-route" {
  route_table_id = aws_route_table.project10-pub-rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.project10-igw.id
}


#public rout table

resource "aws_route_table" "project10-pub-rt" {
  vpc_id = aws_vpc.project10-vpc.id

  route = []

  tags = {
    Name = "project10-pub-rt"
  }
}

#private route table

resource "aws_route_table" "project10-private-rt" {
  vpc_id = aws_vpc.project10-vpc.id

  route = []

  tags = {
    Name = "project10-private-rt"
  }
}

#public route table association subnet

resource "aws_route_table_association" "project10-pubrt-asso1" {
  subnet_id      = aws_subnet.project10-pub-sub1.id
  route_table_id = aws_route_table.project10-pub-rt.id
}

resource "aws_route_table_association" "project10-pubrt-asso2" {
  subnet_id      = aws_subnet.project10-pub-sub2.id
  route_table_id = aws_route_table.project10-pub-rt.id
}

resource "aws_route_table_association" "project10-pubrt-asso3" {
  subnet_id      = aws_subnet.project10-pub-sub3.id
  route_table_id = aws_route_table.project10-pub-rt.id
}

#private route table asocciation subnet

resource "aws_route_table_association" "project10-private-rt-asso1" {
  subnet_id      = aws_subnet.project10-private-sub1.id
  route_table_id = aws_route_table.project10-private-rt.id
}

resource "aws_route_table_association" "project10-private-rt-asso2" {
  subnet_id      = aws_subnet.project10-private-sub2.id
  route_table_id = aws_route_table.project10-private-rt.id
}

resource "aws_route_table_association" "project10-private-rt-asso3" {
  subnet_id      = aws_subnet.project10-private-sub3.id
  route_table_id = aws_route_table.project10-private-rt.id
}
