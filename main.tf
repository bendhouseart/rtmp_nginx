resource "aws_instance" "streaming_server" {
  ami           = var.AMI
  
  instance_type = "t2.micro"
  security_groups = [
      "${aws_security_group.allow_http.name}", 
      "${aws_security_group.allow_rtmp.name}",
      "${aws_security_group.allow_https.name}",
      "${aws_security_group.allow_ssh.name}"
      ]


  //provisioner "local-exec" {
    //command = "echo ${aws_instance.example.private_ip} >> private_ips.txt"
  //}

  tags = {
    Name = "streaming_server"
  }
}

output "ip" {
  value = aws_instance.streaming_server.public_ip
}
