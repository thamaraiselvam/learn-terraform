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
  default = [10, 20, 30]
}

variable "ubuntu_image" {}
