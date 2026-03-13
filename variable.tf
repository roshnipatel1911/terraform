variable "ec2_type" {
    type = string
    default = "t2.nano"
}

variable "ec2_ami" {
    type = string
    default = "ami-0b6c6ebed2801a5cb"
}

variable "ec2_storage" {
    type = number
    default = 8
}

variable "key_pair" {
    type = string
    default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINjLVEMkhVIRPm9FDOAia2VMUs1MK79vwtdIpmNZtebA dhruvpatel@Dhruvs-MacBook-Pro.local"

}