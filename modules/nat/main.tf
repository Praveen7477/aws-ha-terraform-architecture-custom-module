resource "aws_eip" "eip-nat-a" {

  tags   = {
    Name = "eip-nat-a"
  }
}


resource "aws_eip" "eip-nat-b" {

  tags   = {
    Name = "eip-nat-b"
  }
}

resource "aws_nat_gateway" "nat1" {
  allocation_id = aws_eip.eip-nat-a.id
  subnet_id     = var.pub_sub_1a_id

  tags = {
    Name = "NAT1"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.igw_id]
}

resource "aws_nat_gateway" "nat2" {
  allocation_id = aws_eip.eip-nat-b.id
  subnet_id     = var.pub_sub_1a_id

  tags = {
    Name = "NAT2"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [var.igw_id]
}

resource "aws_route_table" "ex" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat1.id
  }


  tags = {
    Name = "rt-1"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = var.pri_sub_3a_id
  route_table_id = aws_route_table.ex.id
}

resource "aws_route_table_association" "b" {
  subnet_id      = var.pri_sub_4b_id
  route_table_id = aws_route_table.ex.id
}



resource "aws_route_table" "ex1" {
  vpc_id = var.vpc_id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id  = aws_nat_gateway.nat2.id
  }


  tags = {
    Name = "rt-2"
  }
}

resource "aws_route_table_association" "pri-sub-5a-with-pri-rt-b" {
  subnet_id      = var.pri_sub_5a_id
  route_table_id = aws_route_table.ex1.id
}

resource "aws_route_table_association" "pri-sub-6b-with-pri-rt-b" {
  subnet_id      = var.pri_sub_6b_id
  route_table_id = aws_route_table.ex1.id
}