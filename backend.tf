terraform {
  backend "s3" {
    # would have to be changed every time s3 bucket is "bootstrapped"
    # if we up the security and randomize bucket's name
    bucket = "tit-terraform-state"
    key    = "terraform.tfstate"
    region = "eu-north-1"
  }
}