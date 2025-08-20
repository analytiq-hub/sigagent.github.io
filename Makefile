.PHONY: dev build clean watch

# Development target - watch both Tailwind and Jekyll with proper signal handling
dev:
	@echo "Starting development environment..."
	@echo "Building initial Tailwind CSS..."
	@./tailwindcss -o assets/css/tailwind.css --minify
	@echo "Starting Tailwind watcher and Jekyll server..."
	@trap 'echo "Stopping all processes..."; kill 0' INT; \
	./tailwindcss -o assets/css/tailwind.css --watch & \
	TAILWIND_PID=$$!; \
	bundle exec jekyll serve & \
	JEKYLL_PID=$$!; \
	echo "Development server running. Press Ctrl+C to stop both processes."; \
	wait

# Build for production
build:
	@echo "Building Tailwind CSS for production..."
	./tailwindcss -o assets/css/tailwind.css --minify
	@echo "Building Jekyll site..."
	bundle exec jekyll build

# Watch Tailwind changes only
watch:
	@echo "Watching Tailwind CSS for changes..."
	./tailwindcss -o assets/css/tailwind.css --watch

# Clean generated files
clean:
	bundle exec jekyll clean
	rm -f assets/css/tailwind.css