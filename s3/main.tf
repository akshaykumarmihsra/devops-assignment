provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAWGFGW5FOHTYKWPMJ"
  secret_key = "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"
}

resource "aws_s3_bucket" "b" {
  bucket = "my-tf-test-bucket-84094"
}

