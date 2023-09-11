# Create Elastic IP for Bastion Host
# Resource - depends_on Meta-Argument
resource "aws_eip" "bastion_eip" {
  depends_on = [aws_instance.bastion_host]
  instance   = aws_instance.bastion_host.id
  domain        = "vpc"
  tags = {
    Name = "${var.environment}-BastionHost-EIP"
  }
}