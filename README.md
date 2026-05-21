# service-order-infra-db

Terraform para PostgreSQL gerenciado da Fase 3.

## Justificativa do PostgreSQL
- dados fortemente relacionais;
- consistência transacional;
- integridade referencial;
- suporte sólido a consultas administrativas e relatórios;
- aderência natural ao domínio de clientes, veículos, ordens, peças, serviços e histórico.

## Recursos
- security group do RDS
- DB subnet group
- RDS PostgreSQL gerenciado

## Entradas
- `aws_region`
- `project_name`
- `environment`
- `vpc_id`
- `private_subnet_ids`
- `app_security_group_id`
- `db_name`
- `db_username`
- `db_password`
- `db_instance_class`
- `db_allocated_storage`
- `db_engine_version`
- `publicly_accessible`

## Saídas
- endpoint e porta do RDS
- nome do banco
- usuário do banco
- `database_url` sensível
- security group do RDS

## Segurança
A senha não é exposta como output. Monte `DATABASE_URL` no pipeline/deploy da API usando secrets do ambiente.

## Execução local
```bash
cp terraform.tfvars.example terraform.tfvars
terraform init
terraform plan
```

Edite `terraform.tfvars` com IDs reais de VPC, subnets privadas e security group da aplicação. Não versione esse arquivo.

## Deploy
```bash
terraform apply
```

Por padrão o RDS não é público (`publicly_accessible=false`) e aceita PostgreSQL apenas a partir do security group do k3s/API.

## CI/CD
O workflow `.github/workflows/terraform.yml` executa `terraform fmt -check`, `terraform init -backend=false`, `terraform validate` e `terraform plan` com valores fake em PR/push. O `apply` fica restrito a `workflow_dispatch` e environment protegido.

## Secrets e variáveis
- `db_password` deve vir de secret local/CI, nunca de arquivo versionado.
- `terraform.tfvars`, `*.tfvars` e state local são ignorados.
- Use o output sensível `database_url` apenas para configurar secrets da API e da Lambda.

## Checklist de validação
- `terraform fmt -check -recursive`
- `terraform init -backend=false`
- `terraform validate`
- `terraform plan` com credenciais AWS e variáveis reais locais
- Conectividade PostgreSQL a partir do nó k3s
