provider "docker" {}

resource "docker_container" "my_nginx" {
 image = "nginx"
 name = "my-nginx"
}

resource "docker_image" "my_ubuntu"{
  name = var.ubuntu_image
}
