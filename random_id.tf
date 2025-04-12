resource "random_id" "vpc_suffix" {
  byte_length = 2
}
resource "random_id" "secret_suffix" {
  byte_length = 4
}