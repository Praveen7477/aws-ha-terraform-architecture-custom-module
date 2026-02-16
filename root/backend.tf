terraform {
  backend "s3" {
    bucket = "praveen-terraform-2026-v1"
    key    = "backend/10weeksofcloudops-demo.tfstate"
    region = "us-east-1"
}
}