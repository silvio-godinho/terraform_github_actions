resource "aws_instance" "github_actions" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type_ec2

  tags = var.tags

}

resource "aws_ec2_instance_state" "github_actions" {
  instance_id = aws_instance.github_actions.id
  state       = var.state_instance
}
