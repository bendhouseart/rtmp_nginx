variable "AWS_REGION" {
    default = "us-west-2"
}

// lazy just using 16.04 ubuntu for us-west-2
variable "AMI" {
    default = "ami-09456e8683eb4d259"
}

// local ip of machine launching instance
variable "MY_IP" {
    default = ""
}