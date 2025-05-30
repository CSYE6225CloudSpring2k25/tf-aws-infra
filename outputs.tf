output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_subnets" {
  value = aws_subnet.public_subnet[*].id
}

output "private_subnets" {
  value = aws_subnet.private_subnet[*].id
}

output "internet_gateway_id" {
  value = aws_internet_gateway.gw.id
}

# output "app_instance_public_ip" {
#   value = aws_instance.app_instance.public_ip
# }

output "rds_endpoint" {
  value = aws_db_instance.rds.endpoint
}

output "s3_bucket" {
  value = aws_s3_bucket.bucket.bucket
}