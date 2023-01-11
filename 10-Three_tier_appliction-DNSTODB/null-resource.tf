resource "aws_instance" "test" {
    connection {
        type = "ssh"
        host = module.bastion_ec2_instance.public_ip
        user = "ec2-user"
        password = ""
        private_key = file("private-key/terraform-key.pem")
    }
    provisioner "file" {
        source = "private-key/terraform-key.pem"
        destination = "/tmp/terraform-key.pem"
    }
    provisioner "remote-exec" {
        inline = [
          "sudo chmod 400 /tmp/terraform-key.pem"
        ]
    }
}