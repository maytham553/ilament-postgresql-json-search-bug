.PHONY: help setup install start stop clean reset

# Default target
help:
	@echo "Available commands:"
	@echo "  make setup    - Complete setup (install, configure, start, migrate)"
	@echo "  make install  - Install dependencies and configure environment"
	@echo "  make start    - Start Docker containers"
	@echo "  make stop     - Stop Docker containers"
	@echo "  make clean    - Stop containers and remove volumes"
	@echo "  make reset    - Clean and setup from scratch"

# Complete setup - runs all steps
setup: install start
	@echo "🚀 Setting up database..."
	@echo "⏳ Waiting for PostgreSQL to be ready..."
	@sleep 5
	./vendor/bin/sail artisan migrate:fresh --seed
	@echo "✅ Setup complete! Access admin at http://localhost:8080/admin"
	@echo "   Login: admin@example.com / password"

# Install dependencies and configure environment
install:
	@echo "📦 Installing dependencies..."
	composer install
	@echo "🔧 Configuring environment..."
	cp .env.example .env
	php artisan key:generate
	@echo "✅ Installation complete!"

# Start Docker containers
start:
	@echo "🐳 Starting containers..."
	./vendor/bin/sail up -d
	@echo "✅ Containers started!"

# Stop Docker containers
stop:
	@echo "🛑 Stopping containers..."
	./vendor/bin/sail down
	@echo "✅ Containers stopped!"

# Clean up containers and volumes
clean:
	@echo "🧹 Cleaning up..."
	./vendor/bin/sail down -v
	@echo "✅ Cleanup complete!"

# Reset everything and setup from scratch
reset: clean setup
	@echo "�� Reset complete!"
