# Component Diagram

```mermaid
flowchart LR
  API[FastAPI on k3s] --> RDS[(PostgreSQL RDS)]
  Lambda[Lambda Auth CPF] --> RDS
```
