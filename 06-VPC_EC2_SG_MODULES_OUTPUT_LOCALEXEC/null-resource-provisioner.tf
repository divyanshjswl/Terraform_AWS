resource "null_resource" "random-null-resource" {
  depends_on = [module.public_ec2_instance]
  #Define the connection to login to Public EC2 where we need to copy the key
  connection {
    type        = "ssh"
    host        = module.public_ec2_instance.id
    user        = "ec2-user"
    password    = ""
    private_key = file("private-key/terraform-key.pem")
  }
  #Define the file provisioner, which file you need to copy
  provisioner "file" {
    source      = "private-key/terraform-key.pem"
    destination = "/tmp/terraform-key.pem"
  }
  #Define remote exec provisioner, to change modification of pem key type
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/terraform-key.pem"
    ]
  }
}