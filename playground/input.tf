variable "myvar" {
  type = string
  default = "hello terraform"
}

variable "mymap" {
  type = map
  default = {
    key = "value"
  }
}

variable "mylist" {
  type = list(number)
  default = [20, 10, 30]
}

variable "ubuntu_image" {}
