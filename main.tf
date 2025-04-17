
resource "aws_instance" "example" {
  ami           = "ami-04f7a54071e74f488"
  instance_type = "t2.micro"

  tags = {
    Name = "terraform-example"
  }
  
}