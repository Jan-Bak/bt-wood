.PHONY: help tag-list tag-create tag-delete tag-push deploy build clean

help:
	@echo "Available commands:"
	@echo "  make tag-list              - List all tags"
	@echo "  make tag-create TAG=v1.0.0 - Create a new tag"
	@echo "  make tag-delete TAG=v1.0.0 - Delete a local tag"
	@echo "  make tag-push              - Push all tags to remote"
	@echo "  make tag-push-single TAG=v1.0.0 - Push a specific tag"
	@echo "  make deploy                - Build and prepare deployment"
	@echo "  make build                 - Build the project"
	@echo "  make clean                 - Clean build artifacts"

# Tag management commands
tag-list:
	@echo "Local tags:"
	@git tag -l
	@echo "\nRemote tags:"
	@git ls-remote --tags origin

tag-create:
	@if [ -z "$(TAG)" ]; then \
		echo "Error: TAG variable not set. Usage: make tag-create TAG=v1.0.0"; \
		exit 1; \
	fi
	@git tag -a $(TAG) -m "Release $(TAG)"
	@echo "✓ Tag $(TAG) created locally"

tag-delete:
	@if [ -z "$(TAG)" ]; then \
		echo "Error: TAG variable not set. Usage: make tag-delete TAG=v1.0.0"; \
		exit 1; \
	fi
	@git tag -d $(TAG)
	@echo "✓ Tag $(TAG) deleted locally"

tag-push:
	@echo "Pushing all tags to remote..."
	@git push origin --tags
	@echo "✓ All tags pushed to remote"

tag-push-single:
	@if [ -z "$(TAG)" ]; then \
		echo "Error: TAG variable not set. Usage: make tag-push-single TAG=v1.0.0"; \
		exit 1; \
	fi
	@git push origin $(TAG)
	@echo "✓ Tag $(TAG) pushed to remote"

# Build and deployment commands
build:
	@echo "Building project..."
	npm run build
	@echo "✓ Build complete"

clean:
	@echo "Cleaning build artifacts..."
	rm -rf dist/ node_modules/ build-*.zip
	@echo "✓ Cleanup complete"

deploy: build
	@echo "Creating deployment archive..."
	@zip -r build-$$(git rev-parse --short HEAD).zip dist/
	@echo "✓ Deployment ready"
	@echo "Note: Push tags to trigger CD: make tag-push TAG=v1.0.0"
