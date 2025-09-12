# Dockerfile
FROM ruby:3.4.4

# Instala pacotes do sistema necessários para compilar gems e rodar Rails
# build-essential \   # ferramentas de compilação (gcc, make, etc.)
#       libpq-dev \         # biblioteca para conectar ao PostgreSQL
#       nodejs \            # necessário para o Rails compilar assets JS
#       yarn \              # gerenciador de pacotes JS (se você usar webpack/esbuild)
#       postgresql-client \ # cliente psql, útil pra rodar comandos no banco
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
      build-essential \
      libpq-dev \
      nodejs \
      yarn \
      postgresql-client \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Instala o Bundler (caso não venha na imagem)
RUN gem install bundler

# Copia Gemfile e Gemfile.lock primeiro para aproveitar o cache
COPY Gemfile Gemfile.lock ./

# Instala gems
RUN bundle install

# Copia o resto do código
COPY . .

ENV RAILS_ENV=development

EXPOSE 3000

# cmd padrão para dev (remove pid se existir)
CMD ["bash", "-lc", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0 -p 3000"]
