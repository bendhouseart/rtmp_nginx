# rtmp_nginx
This repo exists because the nginx-rtmp docker images out there have a bug 
with being unable to write to /var/something..../ permission denied. I attempted 
changing permissions in the container and locally, but I can't be bothered any 
more to fix it.

So, this repo consists of some terraform to set up an EC2 instance on AWS complete
with an Nginx server configured for rtmp streaming with OBS.

I might add docker I might not as the setup of nginx can just be done in user data. 
The server doesn't need to be reliable or persistent as it's going to get torn down
as soon as a movie/series is done playing.

Feel free to use.

## Requirements
- Terraform > 12
- An AWS account

## Setup
```
git clone https://github.com/bendhouseart/rtmp_nginx
touch rtmp_nginx/terraform.tfvars
echo 'MY_IP = "<your ip address>/32"' >> terraform.tfvars
echo 'AWS_REGION = "<your aws region>"' >> terraform.tfvars
echo 'AMI = "<ami image for your region>"' >> terarform.tfvars

terraform apply
```




