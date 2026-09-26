variable "instance_ami_id" {
    type = string
    default = "ami-01a00762f46d584a1"
  
}

variable "instance_type" {
    type = string
    default = "t3.micro"
}

variable "subnet_id" {
    type = string
    default = "subnet-0282000e880022063"
}

variable "environment" {
    type = string
    default = "dev"
  
}

# variable "instance_count" {
#     description = "This is for the number of the ec2 instances"
#     default = 4
#     type = number
# }

variable "associate_public_ip_address" {
    type = bool
    default = true
  
}