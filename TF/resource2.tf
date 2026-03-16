#fetch existing vpc

data "aws_vpc" "my_vpc" {
    id = "vpc-039f20bcf258deea6"
}

#fetch security group 

data "aws_security_group" "launch-wizard-3" {
    id = "sg-0cbd9a0e0ac4c8cf5"
}

# create ec2 instance

resource "aws_instance" "server1" {
    instance_type = "t2.micro"
    ami = "ami-0b6c6ebed2801a5cb"
    subnet_id = "subnet-006ae9703345dbd74"
    vpc_security_group_ids = [data.aws_security_group.launch-wizard-3.id]
    user_data = file("userdata.sh")

    root_block_device {
        volume_size = 8
        volume_type = "gp3"
    }

    tags = {
        Name = "web_server1"
    }

}