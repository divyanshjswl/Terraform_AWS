resource "null_resource" "test" {
  depends_on = [module.public_ec2_instance]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type        = "ssh"
    host        = module.public_ec2_instance.public_ip
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/private-key.ppk")
  }

  ## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
  # Remote Exec Provisioner : To change the permission on the key
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
}
