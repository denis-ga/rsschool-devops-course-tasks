terraform {
  backend "s3" {
    bucket         = "terraform-state-denis-rs"
    key            = "global/s3/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "terraform-locks"
    use_lockfile   = true
    encrypt        = true
    profile        = "aws-rs-devops"
  }
}