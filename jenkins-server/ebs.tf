resource "aws_ebs_volume" "jenkins_extra" {
  availability_zone = module.ec2_instance.availability_zone
  size              = 20
  type              = "gp3"

  tags = {
    Name = "jenkins-extra-disk"
  }
}

resource "aws_volume_attachment" "jenkins_attach" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.jenkins_extra.id

  instance_id = module.ec2_instance.id

  force_detach = true
}