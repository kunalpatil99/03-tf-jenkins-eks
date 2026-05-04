terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-kp"
    key    = "jenkin/terraform.tfstate"
    region = "ap-south-1"
  }
}