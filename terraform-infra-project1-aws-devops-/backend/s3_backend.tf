resource "aws_s3_bucket" "terraform_state" {
  bucket = "tf-state-999"
  versioning { enabled = true }
  lifecycle { prevent_destroy = true }
  tags = { Name = "terraform-state-999" }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks-999"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute { name = "LockID" type = "S" }
}

output "backend_bucket" { value = aws_s3_bucket.terraform_state.bucket }
output "dynamodb_table" { value = aws_dynamodb_table.terraform_locks.name }
