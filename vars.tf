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

variable "public_key" {
    default = "mykey.pub"
}

variable "url_front" {
    default = "rtmp://"
}

variable "url_broadcast_to" {
    default = "/live"
}

variable "url_stream" {
    default = "/test"
}