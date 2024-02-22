variable "type_ec2" {
  default = "t2.micro"
}

variable "tags" {
  type = map(string)
  default = {
    projeto = "github_actions"
    versao  = "1.0.0"
    Name    = "ubuntu-test-actions"
  }
}

variable "state_instance" {
  default = "stopped"
}
