# ELK instance
resource "aws_instance" "my_elk_instance" {
  ami = data.aws_ami.ubuntu.id
  instance_type = [for s in var.myInstance : lower(s)][1]
  #instance_type = var.myInstance[1]
  #instance_type = var.map["stage"]
  subnet_id     = data.terraform_remote_state.vpc.outputs.public[1]
  key_name      = var.my_key

  metadata_options {
    http_tokens   = "required"
    http_endpoint = "enabled"
  }

  root_block_device {
    encrypted = true
  }

  vpc_security_group_ids = [
    aws_security_group.elk_sg.id,
  ]

  depends_on = [aws_security_group.elk_sg]
}

# EIP
resource "aws_eip" "ip" {
  instance = aws_instance.my_elk_instance.id
}

