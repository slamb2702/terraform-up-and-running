
resource "aws_autoscaling_group" "example" {
  # launch_configuration = aws_launch_configuration.example.name
  launch_template {
    id      = aws_launch_template.example.id
    version = aws_launch_template.example.latest_version
  }


  vpc_zone_identifier = data.aws_subnets.default.ids

  target_group_arns = [aws_lb_target_group.asg.arn]
  health_check_type = "ELB"

  min_size = 2
  max_size = 10



  tag {
    key                 = "Name"
    value               = "terraform-asg-example"
    propagate_at_launch = true
  }
}

# resource "aws_launch_configuration" "example" {
#   image_id        = "ami-04f7a54071e74f488"
#   instance_type   = "t2.micro"
#   security_groups = [aws_security_group.instance.id]

#   user_data = <<-EOF
#               #!/bin/bash
#               echo "Hello, World" > index.html
#               nohup busybox httpd -f -p ${var.server_port} &
#               EOF

#   # Required when using a launch configuration with an auto scaling group.
#   lifecycle {
#     create_before_destroy = true
#   }

# }

resource "aws_launch_template" "example" {
  name = "aws_launch_template_example"

  image_id      = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"

  vpc_security_group_ids = [aws_security_group.instance.id]
  block_device_mappings {
    device_name = "/dev/sdf"

    ebs {
      volume_size           = 2
      delete_on_termination = true
    }

  }

  monitoring {
    enabled = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "test"
    }
  }

  # user_data = <<-EOF
  #           #!/bin/bash
  #           echo "Hello, World" > index.html
  #           nohup busybox httpd -f -p ${var.server_port} &
  #           EOF
}




