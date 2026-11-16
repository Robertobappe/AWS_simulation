variable "region" {
  description = "Região AWS"
  type        = string
  default     = "us-east-1"
}

variable "localstack_endpoint" {
  description = "Endpoint do LocalStack"
  type        = string
  default     = "http://localhost:4566"
}

variable "bucket_name" {
  description = "Nome do bucket S3"
  type        = string
  default     = "aws-simulation-bucket"
}
