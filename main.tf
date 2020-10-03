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
  user_data = file("user-data.sh")
  key_name = aws_key_pair.ubuntu.key_name

  connection {
    type = "ssh"
    user = "ubuntu"
    private_key = file("mykey")
    host = self.public_ip
  }

  tags = {
    Name = "streaming_server"
  }
}

resource "aws_key_pair" "ubuntu" {
  key_name = "ubuntu"
  public_key = file(var.public_key)
}

output "ip" {
  value = aws_instance.streaming_server.public_ip
}

output "OBS_streaming_url_broadcast_to" {
  value = "${var.url_front}${aws_instance.streaming_server.public_ip}${var.url_broadcast_to}"
}

output "VLC_url_stream_to_receieve" {
  value = "${var.url_front}${aws_instance.streaming_server.public_ip}${var.url_broadcast_to}${var.url_stream}"
}