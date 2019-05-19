// output can be queried using the 'terraform output' command
output "ip" {
  value = "${aws_eip.ip.public_ip}"
}
