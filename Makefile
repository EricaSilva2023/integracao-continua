help:
	@echo "  Comandos disponíveis:"
	@echo "  make lint    - Executa a análise estática"
	@echo "  make test    - Executa os testes automatizados"
	@echo "  make start   - Inicia a aplicação com Docker Compose"
	@echo "  make ci      - Executa start, lint e test"

lint:
	docker run --rm -itv $(CURDIR):/app -w /app golangci/golangci-lint golangci-lint run controllers/ database/ models/ routes/
test:
	docker compose exec app go test main_test.go
start:
	docker compose up -d
ci: start lint test