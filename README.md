# Filament PostgreSQL JSON Search Bug Report

## Quick Start

```bash
# Complete setup in one command
make setup

# Access admin at http://localhost:8080/admin
# Login: admin@example.com / password
```

## Available Commands

```bash
make setup    # Complete setup (install, configure, start, migrate)
make start    # Start Docker containers
make stop     # Stop Docker containers
make reset    # Clean and setup from scratch
```

## Reproduce the Bug

1. Go to http://localhost:8080/admin
2. Login with admin@example.com / password
3. Go to Products page (list view only)
4. Try searching for "رايبان" or "Ray-Ban"
5. You'll get a PostgreSQL syntax error

## Project Details

-   **Database**: PostgreSQL
-   **Models**: Product with translatable name field
-   **Test Data**: 5 products with Arabic/English translations
