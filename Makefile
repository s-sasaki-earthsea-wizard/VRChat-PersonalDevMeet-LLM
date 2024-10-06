# Make 'help' the default target
.DEFAULT_GOAL := help

# Variables
COMPOSE = docker-compose
include .env

# ------------------------------------------------------------------------------
# Docker commands
# ------------------------------------------------------------------------------

# Build the Docker image
build:
	$(COMPOSE) build

# Run Fusuma in a Docker container
run:
	$(COMPOSE) run --rm fusuma fusuma -c /app/config/fusuma/config.yml

# Clean up Docker resources
clean:
	$(COMPOSE) down --rmi all --volumes --remove-orphans

# ------------------------------------------------------------------------------
# Fusuma commands
# ------------------------------------------------------------------------------

# Run Fusuma with live reload
live:
	$(COMPOSE) run --rm -p ${FUSUMA_PORT}:${FUSUMA_PORT} fusuma fusuma -c /app/config/fusuma/config.yml -l

# Start a bash shell in the Docker container
bash:
	$(COMPOSE) run --rm fusuma bash

# ------------------------------------------------------------------------------
# help
# ------------------------------------------------------------------------------
help:
	@echo "══════════════════════════════════════════════════════════════════"
	@echo "               $(PROJECT_NAME) Makefile Help                      "
	@echo "══════════════════════════════════════════════════════════════════"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@echo "Targets:"
	@echo "  build     Build the Docker image ($(PROJECT_NAME)-image)"
	@echo "  run       Run Fusuma in a Docker container ($(PROJECT_NAME)-container)"
	@echo "  live      Run Fusuma with live reload"
	@echo "  bash      Start a bash shell in the Docker container"
	@echo "  clean     Clean up Docker resources"
	@echo "  help      Display this help message"
	@echo ""
	@echo "For more information, please refer to the project documentation."

# ------------------------------------------------------------------------------
.PHONY: build run live bash clean