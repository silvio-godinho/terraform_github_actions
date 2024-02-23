resource "aws_instance" "github_actions" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.type_ec2
  subnet_id     = aws_subnet.github_actions_my_subnet.id

    // Definindo o bloco de dispositivo EBS para a instância
  ebs_block_device {
    device_name = "/dev/sdf"  // Nome do dispositivo na instância

    // ID do volume EBS que você criou
    volume_id   = aws_ebs_volume.github_actions.id

    // Definindo se o volume será apagado quando a instância for destruída
    delete_on_termination = true
  }

  tags = var.tags

}

resource "aws_ebs_volume" "github_actions" {
  availability_zone = data.aws_region.current.name
  size              = 40

  tags = var.tags
}

resource "aws_ec2_instance_state" "github_actions" {
  instance_id = aws_instance.github_actions.id
  state       = var.state_instance
}
