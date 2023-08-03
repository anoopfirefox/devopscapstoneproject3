resource "aws_launch_template" "capstone_template" {
  name          = "capstone_template"
  image_id      = "ami-0430580de6244e02e"
  instance_type = "t2.micro"
  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.capstone_sg.id]
  }
}
resource "aws_autoscaling_group" "capstone_asg" {
  name                = "capstone-asg"
  max_size            = 3
  min_size            = 1
  health_check_type   = "EC2"
  desired_capacity    = 1
  vpc_zone_identifier = [aws_subnet.capstonesubnet_a.id, aws_subnet.capstonesubnet_b.id, aws_subnet.capstonesubnet_c.id]
  launch_template {
    id = aws_launch_template.capstone_template.id
  }
}
resource "aws_autoscaling_policy" "capstone_asg_policy" {
  name                      = "capstone-asg-policy"
  policy_type               = "TargetTrackingScaling"
  autoscaling_group_name    = aws_autoscaling_group.capstone_asg.name
  estimated_instance_warmup = 200
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
  }
}
















