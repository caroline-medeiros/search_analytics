# 📊 Search Analytics

Aplicação Rails 8 para registrar e analisar pesquisas de usuários em tempo real.  
O foco não é o mecanismo de busca em si, mas sim a **captura, filtragem e análise das consultas** realizadas pelos usuários.

---

## 🚀 Tecnologias

- [Ruby 3.4.4](https://www.ruby-lang.org)
- [Rails 8.x](https://rubyonrails.org)
- [PostgreSQL](https://www.postgresql.org)
- [Turbo / Hotwire](https://turbo.hotwired.dev) para pesquisa em tempo real
- [RSpec](https://rspec.info) para testes

---

## ⚙️ Configuração do ambiente
### Configurando o banco de dados

1. Copie o arquivo de exemplo:
```bash
cp config/database.yml.example config/database.yml

Ajuste username e password para seu Postgres local.

Crie os bancos de dados:
``bin/rails db:create db:migrate



