terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks-kp"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
