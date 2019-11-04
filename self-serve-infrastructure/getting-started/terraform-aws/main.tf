provider "aws" {
  region = "${var.region}"
}

resource "aws_vpc" "demo_vpc" {
  cidr_block = "${var.vpc_cidr_block}"
  
  tags = {
    Name = "aws-main-vpc"
    ManagedBy = "Terraform Cloud"
  }
}

resource "aws_subnet" "demo_subnet" {
  vpc_id            = "${aws_vpc.demo_vpc.id}"
  cidr_block        = "${var.subnet_cidr_block}"
  availability_zone = "${var.subnet_availability_zone}"
}
