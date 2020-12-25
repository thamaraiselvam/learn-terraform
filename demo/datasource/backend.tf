terraform {

  backend "s3" {

    bucket = "terraform-state-211sdf"
    key    = "terraform/datasource/state"
    region = "ap-south-1"
  }
}

