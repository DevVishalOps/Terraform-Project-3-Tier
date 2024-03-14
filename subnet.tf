resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pub1_cidr
  availability_zone = var.az_pub
  tags = var.pub1_sub_tags
}

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pub2_cidr
  availability_zone = var.az_pub
  tags = var.pub2_sub_tags
}

resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = var.pvt_cidr
  availability_zone = var.az_pvt
  tags =var.pvt_sub_tags
}

data "aws_subnets" "sid" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.my_vpc.id]
  }

  tags = {
    Tier = "Public"
  }
}
