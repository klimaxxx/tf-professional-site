terraform {
  backend "s3" {
    bucket = "tf-state-professional-site"
    key    = "terraform.tfstate"
    region = "us-west-1"
  }
}