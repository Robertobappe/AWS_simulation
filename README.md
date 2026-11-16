# AWS_simulation

Simulação local de serviços AWS com [LocalStack](https://www.localstack.cloud/), com a infraestrutura criada via Terraform.

## Pré-requisitos

- Docker Desktop (com WSL 2)
- Terraform >= 1.6
- Token do LocalStack em `.env` (`LOCALSTACK_AUTH_TOKEN=...`), obtido em app.localstack.cloud → Settings → Auth Tokens

## 1. Subir o LocalStack

```bash
docker compose up -d
docker logs -f localstack   # aguarde "Ready."
```

## 2. Criar a infraestrutura com Terraform

```bash
cd terraform
terraform init      # baixa o provider AWS (só na primeira vez)
terraform plan      # mostra o que será criado
terraform apply     # cria o bucket e o arquivo a.txt
```

Arquivos em [terraform/](terraform/):

| Arquivo | Conteúdo |
|---|---|
| `versions.tf` | Versão do Terraform e do provider AWS |
| `provider.tf` | Provider AWS apontado para o LocalStack (`localhost:4566`) |
| `variables.tf` | Região, endpoint e nome do bucket |
| `main.tf` | Bucket S3 `aws-simulation-bucket` e objeto `a.txt` |
| `outputs.tf` | Nome, ARN e URL do arquivo de exemplo |

## 3. Testar

- Navegador: http://localhost:4566/aws-simulation-bucket/a.txt
- Site do LocalStack: app.localstack.cloud → Resource Browser → S3
- CLI: `docker exec localstack awslocal s3 ls s3://aws-simulation-bucket/`

## Destruir / parar

```bash
cd terraform && terraform destroy   # remove os recursos
docker compose down                 # para o LocalStack
```

> Ao recriar o container, os dados do LocalStack se perdem. Basta rodar `terraform apply` de novo:
> o Terraform percebe que o bucket sumiu e o recria.
