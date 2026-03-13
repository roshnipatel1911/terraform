#create SG 

resource "aws_security_group" "terra_sg" {
    name = "task2_sg"
    description = "for new ec2"

ingress {
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

# create ec2

resource "aws_instance" "my_instance" {
    instance_type = var.ec2_type
    ami = var.ec2_ami
    vpc_security_group_ids = [aws_security_group.terra_sg.id]
    key_name = var.key_pair

    root_block_device {
        volume_type = "gp3"
        volume_size = var.ec2_storage
    }

    tags = {
        Name = "myself"
    }
}
    