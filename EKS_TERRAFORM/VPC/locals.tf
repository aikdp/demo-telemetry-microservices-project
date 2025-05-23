locals {
  module_name = "${var.project}-${var.environment}"
  az_zones = slice((data.aws_availability_zones.available.names), 0, 2) #u can select any no. of zones for HA of application. u can give cidrs for remainingg zones az=3, pub-cidrs=3.
}
