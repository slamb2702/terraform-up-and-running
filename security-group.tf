
resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = var.server_port
    to_port     = var.server_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "alb" {
  name = "terraform-example-alb"

  ingress = [
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow inbound HTTP requests"
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },
    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "HTTPS"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    },

    {
      cidr_blocks = ["0.0.0.0/0"]
      description = "SSH"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]

  egress = [
    {
      cidr_blocks = ["0.0.0.0/0"]

      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      description = "Allow outbound requests"

      ipv6_cidr_blocks = []
      prefix_list_ids  = []
      security_groups  = []
      self             = false
    }
  ]
}