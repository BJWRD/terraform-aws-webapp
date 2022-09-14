locals {
  name_suffix = "${var.project_name}-${var.environment}"
}

locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment,
  }
  tags = merge(var.resource_tags, local.required_tags)
}

#EC2 Webapp Host
resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = var.ami_id
  subnet_id     = var.subnet_id
  instance_type = var.instance_type
  vpc_security_group_ids = [var.vpc_security_group_ids]
  #key_name - allows private key (.pem file) to be used with ec2 instance
  key_name = "terraform"

  tags = local.tags

  connection {
    type  = "ssh"
    user  =  "ec2-user"
    #private_key is created within AWS EC2 Console, .pem file placed in same directory as .tf
    private_key = file("./terraform.pem")
    #allows connection to newly created ec2 instance
    host = self.public_ip
   }

provisioner "remote-exec" {
  #inline command allows you to enter a list of executable commands within your instance
  inline = [
    "sudo yum update -y",
    "sudo amazon-linux-extras install docker -y",
    "sudo systemctl enable docker --now",
    "sudo systemctl enable containerd.service --now",
    "sudo usermod -a -G docker ec2-user",
    "sudo curl -L https://github.com/docker/compose/releases/tag/v2.10.2/docker-compose-$(uname -s)-$(uname-m) -o /usr/local/bin/docker-compose",
    "sudo chmod +x /usr/local/bin/docker-compose"
  ]
 }
}
