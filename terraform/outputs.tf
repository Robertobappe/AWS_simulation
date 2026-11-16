output "bucket_name" {
  value = aws_s3_bucket.this.id
}

output "bucket_arn" {
  value = aws_s3_bucket.this.arn
}

output "exemplo_url" {
  value = "${var.localstack_endpoint}/${aws_s3_bucket.this.id}/${aws_s3_object.exemplo.key}"
}
