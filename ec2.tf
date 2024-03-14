
resource "aws_instance" "web1" {
  ami           = var.ami_web
  instance_type = var.instance_type_web
  key_name = var.key_name_web
  subnet_id = aws_subnet.public1.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true

  tags =var.web1_tags

  provisioner "file" {
    source = "./youtube-key.pem"
    destination = "/home/ubuntu/youtube-key.pem"
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = "${file("./youtube-key.pem")}"
    }  
  }
}

resource "aws_instance" "web2" {
  ami           = var.ami_web
  instance_type = var.instance_type_web
  key_name = var.key_name_web
  subnet_id = aws_subnet.public2.id
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  associate_public_ip_address = true

  tags =var.web2_tags

  provisioner "file" {
    source = "./youtube-key.pem"
    destination = "/home/ubuntu/youtube-key.pem"
  
    connection {
      type = "ssh"
      host = self.public_ip
      user = "ubuntu"
      private_key = "${file("./youtube-key.pem")}"
    }  
  }
}

resource "aws_instance" "db" {
  ami           = var.ami_db
  instance_type = var.instance_type_db
  key_name = var.key_name_db
  subnet_id = aws_subnet.private.id
  vpc_security_group_ids = [aws_security_group.allow_tls_db.id]

  tags = var.db_tags
}
