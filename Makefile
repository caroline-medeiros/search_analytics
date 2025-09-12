.PHONY: install test docker-compose-up

docker-compose-up:
	@if command -v docker-compose &>/dev/null; then \
		docker-compose up -d --no-recreate db; \
	elif command -v docker\ compose &>/dev/null; then \
		docker compose up -d --no-recreate db; \
	else \
		echo "Docker Compose is not installed. Please install it."; \
		exit 1; \
	fi

install:
	bundle install

server: docker-compose-up install
	bin/rails db:create db:migrate db:seed
	bin/rails s

test: docker-compose-up
	RAILS_ENV=test rails db:drop db:create db:migrate db:seed && rspec
