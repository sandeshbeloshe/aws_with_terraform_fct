resource "aws_key_pair" "san_self_managed_key" {
  key_name   = var.key_name
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID5iyceJF6FJ74D8D0Kg2Mlcypob9c+A0jsja9hX86cN sandeshbeloshe6@gmail.com"

}