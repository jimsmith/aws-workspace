resource "aws_eip" "nat_gw" {
  vpc = true

  tags {
    Name = "${var.prefix}-nat-gw"
  }
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = "${aws_eip.nat_gw.id}"
  subnet_id     = "${aws_subnet.public_nat_subnet_1c.id}"

  tags {
    Name = "${var.prefix}-nat-gw"
  }

  depends_on = [
    "aws_subnet.public_nat_subnet_1c",
  ]
}
