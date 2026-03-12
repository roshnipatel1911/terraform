
# Fetch existing VPC
data "aws_vpc" "myvpc" {
  id = "vpc-0d308bb13c4459a83"
}

# Fetch existing Subnet
data "aws_subnet" "web_public" {
  id = "subnet-09d3d261e96703c1e"
}

# Create Key Pair
resource "aws_key_pair" "my_key_pair" {
  key_name   = "terra-key-ec2"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDqeT87I3D/S7afDBOjboYP+hw0Y01acw+Eq/K0xI5AF dhruvpatel@Dhruvs-MacBook-Pro.local"
}

# Create Security Group
resource "aws_security_group" "my_sg" {
  name        = "terra-sg-1"
  description = "Security group for EC2"
  vpc_id      = data.aws_vpc.myvpc.id

  
  ingress {
    description = "SSH access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create EC2 Instance
resource "aws_instance" "my_instance" {

  ami           = "ami-0b6c6ebed2801a5cb"
  instance_type = "t2.micro"

  subnet_id = data.aws_subnet.web_public.id

  vpc_security_group_ids = [
    aws_security_group.my_sg.id
  ]

  key_name = aws_key_pair.my_key_pair.key_name

  root_block_device {
    volume_size = 8
    volume_type = "gp3"
  }

  tags = {
    Name = "MyEC2Instance"
  }
}
