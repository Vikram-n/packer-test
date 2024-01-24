packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.8"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "ubuntu" {
  ami_name      = "learn-packer-linux-aws"
  instance_type = "t2.micro"
  region        = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-jammy-22.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["099720109477"]
  }
  ssh_username = "ubuntu"
}

build {
  name    = "learn-packer"
  sources = [
    "source.amazon-ebs.ubuntu"
  ]
  provisioner "file" {
    source = "provisioner.sh"
    destination = "/tmp/provisioner.sh"
  }
  provisioner "shell" {
    inline =["chmod a+x /tmp/provisioner.sh"]

  }
  provisioner "shell"{
    inline = ["ls -la /tmp"]
  }
  provisioner "shell"{
    inline = ["pwd"]
  }
  provisioner "shell"{
    inline =["cat /tmp/provisioner.sh"]
    }
    provisioner "shell"{
        inline = ["/bin/bash -x /tmp/provisioner.sh"]
    }

  }

