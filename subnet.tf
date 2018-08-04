resource "aws_subnet" "public_nat_subnet_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.20.0.0/24"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "${var.prefix}-public-nat-1c"
  }
}

resource "aws_route_table" "public_nat_subnet_1c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "${var.prefix}-public-nat-1c"
  }
}

resource "aws_route_table_association" "public_nat_subnet_1c" {
  subnet_id      = "${aws_subnet.public_nat_subnet_1c.id}"
  route_table_id = "${aws_route_table.public_nat_subnet_1c.id}"
}

resource "aws_subnet" "public_subnet_1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.20.1.0/24"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "${var.prefix}-public-1a"
  }
}

resource "aws_route_table" "public_subnet_1a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "${var.prefix}-public-1a"
  }
}

resource "aws_route_table_association" "public_subnet_1a" {
  subnet_id      = "${aws_subnet.public_subnet_1a.id}"
  route_table_id = "${aws_route_table.public_subnet_1a.id}"
}

resource "aws_subnet" "public_subnet_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.20.2.0/24"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "${var.prefix}-public-1c"
  }
}

resource "aws_route_table" "public_subnet_1c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }

  tags {
    Name = "${var.prefix}-public-1c"
  }
}

resource "aws_route_table_association" "public_subnet_1c" {
  subnet_id      = "${aws_subnet.public_subnet_1c.id}"
  route_table_id = "${aws_route_table.public_subnet_1c.id}"
}

resource "aws_subnet" "private_subnet_1a" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.20.10.0/24"
  availability_zone = "ap-northeast-1a"

  tags {
    Name = "${var.prefix}-private-1a"
  }
}

resource "aws_route_table" "private_subnet_1a" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags {
    Name = "${var.prefix}-private-1a"
  }

  depends_on = [
    "aws_nat_gateway.nat_gw",
  ]
}

resource "aws_route_table_association" "private_subnet_1a" {
  subnet_id      = "${aws_subnet.private_subnet_1a.id}"
  route_table_id = "${aws_route_table.private_subnet_1a.id}"
}

resource "aws_subnet" "private_subnet_1c" {
  vpc_id            = "${aws_vpc.vpc.id}"
  cidr_block        = "10.20.11.0/24"
  availability_zone = "ap-northeast-1c"

  tags {
    Name = "${var.prefix}-private-1c"
  }
}

resource "aws_route_table" "private_subnet_1c" {
  vpc_id = "${aws_vpc.vpc.id}"

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = "${aws_nat_gateway.nat_gw.id}"
  }

  tags {
    Name = "${var.prefix}-private-1c"
  }

  depends_on = [
    "aws_nat_gateway.nat_gw",
  ]
}

resource "aws_route_table_association" "private_subnet_1c" {
  subnet_id      = "${aws_subnet.private_subnet_1c.id}"
  route_table_id = "${aws_route_table.private_subnet_1c.id}"
}
