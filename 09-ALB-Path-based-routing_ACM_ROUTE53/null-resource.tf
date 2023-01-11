resource "null_resource" "test" {
  depends_on = [module.public_ec2_instance]
  # Connection Block for Provisioners to connect to EC2 Instance
  connection {
    type     = "ssh"
    host     = module.ec2_complete_public_ip.public_ip    
    user     = "ec2-user"
    password = ""
    private_key = file("private-key/private-key.ppk")
  }  

## File Provisioner: Copies the terraform-key.pem file to /tmp/terraform-key.pem
  provisioner "file" {
    source      = "private-key/private-key.ppk"
    destination = "/tmp/private-key.ppk"
  }
## Remote Exec Provisioner: Using remote-exec provisioner fix the private key permissions on Bastion Host
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 400 /tmp/private-key.ppk"
    ]
  }
}