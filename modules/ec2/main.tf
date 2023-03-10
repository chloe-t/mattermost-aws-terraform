resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  availability_zone           = var.availability_zone
  associate_public_ip_address = true

  # Security group assign to instance
  vpc_security_group_ids = [var.aws_security_group_id]
  #security_groups
  subnet_id = var.aws_subnet_id
  key_name  = var.key_name
  user_data = file("./scripts/${var.install_script_name}")
  tags      = merge({ "Name" = "ec2-${var.project_name}" }, var.tags)
}


# Use key_name in instance or "aws_key_pair" ressource
/* resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
} */

resource "aws_ebs_volume" "this" {
  availability_zone = var.availability_zone
  size              = 40
}

resource "aws_volume_attachment" "this" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.this.id
  instance_id = aws_instance.this.id
}

resource "aws_cloudwatch_metric_alarm" "this" {

  alarm_name                = "cpu-utilization"
  comparison_operator       = "GreaterThanOrEqualToThreshold"
  evaluation_periods        = "2"
  metric_name               = "CPUUtilization"
  namespace                 = "AWS/EC2"
  period                    = "120" #seconds
  statistic                 = "Average"
  threshold                 = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []

  dimensions = {
    InstanceId = aws_instance.this.id
  }

}
