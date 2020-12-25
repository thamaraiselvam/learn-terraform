variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1     = "ami-005634d2b7691f303"
    ap-southeast-1 = "ami-07df7fb40f8489a1e"
  }
}
