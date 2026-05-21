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
- `vpc_id`
- `private_subnet_ids`
- `app_security_group_id`
- `db_password`

## Saídas
- endpoint do RDS
- nome do banco
- usuário do banco

## Segurança
A senha não é exposta como output. Monte `DATABASE_URL` no pipeline/deploy da API usando secrets do ambiente.
