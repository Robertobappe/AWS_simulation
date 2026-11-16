resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name

  tags = {
    Project     = "AWS_simulation"
    Environment = "local"
  }
}

# Arquivo de exemplo dentro do bucket
resource "aws_s3_object" "exemplo" {
  bucket       = aws_s3_bucket.this.id
  key          = "a.txt"
  content      = "ola\n"
  content_type = "text/plain"
}


