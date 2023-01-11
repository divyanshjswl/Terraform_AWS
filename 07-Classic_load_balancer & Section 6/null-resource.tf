resource "null_resource" "test" {
  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/private-key/"
  }

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = ""
    host        = module.public_ec2_instance.public_ip
    private_key = file("private-key/terraform-key.pem")
  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
}