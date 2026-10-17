.DEFAULT_GOAL := help
SHELL := /bin/bash

.PHONY: help bump-version-major bump-version-minor bump-version-patch

## help: pokaż tę pomoc
help:
	@echo "  make bump-version-patch   - patch (1.0.X)"
	@echo "  make bump-version-minor   - minor (1.X.0)"
	@echo "  make bump-version-major   - major (X.0.0)"

## bump-version-patch: bump patch + push
bump-version-patch:
	@read -p "Are you sure? (PATCH UPDATE) [y/N] " ans; \
	if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
		echo "Cancelled."; \
		exit 1; \
	fi; \
	@npm version patch && git push origin main --tags

## bump-version-minor: bump minor + push
bump-version-minor:
	@read -p "Are you sure? (MINOR UPDATE) [y/N] " ans; \
	if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
		echo "Cancelled."; \
		exit 1; \
	fi; \
	@npm version minor && git push origin main --tags

## bump-version-major: bump major + push (z potwierdzeniem)
bump-version-major:
	@read -p "Are you sure? (MAJOR UPDATE) [y/N] " ans; \
	if [ "$$ans" != "y" ] && [ "$$ans" != "Y" ]; then \
		echo "Cancelled."; \
		exit 1; \
	fi; \
	npm version major && git push origin main --tags