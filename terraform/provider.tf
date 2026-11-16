# Provider AWS apontado para o LocalStack.
# Na AWS de verdade, este bloco teria só a região; credenciais viriam do
# ambiente (aws configure / variáveis AWS_*) e não haveria "endpoints".
provider "aws" {
  region = var.region

  # Credenciais falsas aceitas pelo LocalStack
  access_key = "test"
  secret_key = "test"

  # Evita chamadas à AWS real para validar conta/credenciais
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  # URLs no formato localhost:4566/<bucket> em vez de <bucket>.s3.amazonaws.com
  s3_use_path_style = true

  endpoints {
    s3 = var.localstack_endpoint
  }
}
