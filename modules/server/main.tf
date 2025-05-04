# ec2 sg eip key iamrole ebs 
resource "aws_spot_instance_request" "worker" {
  wait_for_fulfillment = "true"
  instance_interruption_behavior = "stop"

  ami   = "ami-xxx"
  instance_type = "t3.small"
  subnet_id   = var.worker_subnet_id
  associate_public_ip_address = "true"
  vpc_security_group_ids = [
  aws_security_group.allow_ssh.id
  ]

  credit_specification {
  cpu_credits = "standard"
  }

  key_name = "xxxxx"
  iam_instance_profile = var.iam_worker_profile_name

  tags = {
  Name = "${format("worker-%02d", count.index + 1)}"
  }

  count = 2

  lifecycle {
  ignore_changes = [id]
  }
}

# Request a spot instance at $0.03
resource "aws_spot_instance_request" "cheap_worker" {
  ami           = "ami-1234"
  spot_price    = "0.03"
  instance_type = "c4.xlarge"

  tags = {
    Name = "CheapWorker"
  }
}