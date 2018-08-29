resource "aws_s3_bucket" "terraform-state-storage" {
  bucket = "terraform-state-storage"
  acl    = "private"

  versioning {
    enabled = true
  }
}
