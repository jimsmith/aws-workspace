resource "aws_dynamodb_table" "tfstate_lock" {
  name           = "terraform-lock-table"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"      # S = String
  }
}
