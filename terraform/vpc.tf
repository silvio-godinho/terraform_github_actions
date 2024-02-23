data "aws_region" "current" {}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/24"

  tags = var.tags
}

resource "aws_subnet" "github_actions_my_subnet" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = data.aws_region.current.name

  tags = var.tags
}
