terraform {
  backend "s3" {
    bucket         = "sample-terraform-state-bucket-new"
    key            = "state/infra-interview-task.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

