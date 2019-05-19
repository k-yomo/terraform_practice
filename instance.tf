resource "aws_instance" "instance" {
  // Ubuntu 16.10 AMI
  ami           = "${var.amis[var.region]}"
  instance_type = "t2.micro"

  // Multiple provisioners are executed in the order they're defined
  provisioner "local-exec" {
    command = "echo ${aws_instance.instance.public_ip} > ./temp/ip_address.txt"
  }

  provisioner "local-exec" {
    command = "cat ./temp/ip_address.txt"
  }

  // Destroy-Time Provisioners
  provisioner "local-exec" {
    when    = "destroy"
    command = "rm ./temp/ip_address.txt"
    // continue or fail
    on_failure = "continue"
  }

  // explicit dependency
  depends_on = [
  "aws_s3_bucket.s3_bucket"]
}

// Elastic IP
resource "aws_eip" "ip" {
  // implicit dependency that requires terraform to create instance first, then ip
  instance = "${aws_instance.instance.id}"
}

