# Distributed Systems Socket Communication Library - Professional Build System
# Author: Marwa
# Version: 1.0.0

CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -pedantic -O2
DEBUG_FLAGS = -g -DDEBUG
RELEASE_FLAGS = -O2 -DNDEBUG -flto

TARGET_SERVER = server
TARGET_CLIENT = client
SOURCE_SERVER = server.c
SOURCE_CLIENT = client.c

# Version information
VERSION = 1.0.0
BUILD_DATE = $(shell date +%Y-%m-%d)

# Default target
all: release

# Release build (optimized)
release: CFLAGS += $(RELEASE_FLAGS)
release: $(TARGET_SERVER) $(TARGET_CLIENT)
	@echo "✅ Release build completed successfully"

# Debug build
debug: CFLAGS += $(DEBUG_FLAGS)
debug: $(TARGET_SERVER) $(TARGET_CLIENT)
	@echo "✅ Debug build completed successfully"

# Build server
$(TARGET_SERVER): $(SOURCE_SERVER)
	@echo "🔨 Building server..."
	$(CC) $(CFLAGS) -o $(TARGET_SERVER) $(SOURCE_SERVER)
	@echo "✅ Server built successfully"

# Build client  
$(TARGET_CLIENT): $(SOURCE_CLIENT)
	@echo "🔨 Building client..."
	$(CC) $(CFLAGS) -o $(TARGET_CLIENT) $(SOURCE_CLIENT)
	@echo "✅ Client built successfully"

# Install to system
install: release
	@echo "📦 Installing to /usr/local/bin..."
	sudo cp $(TARGET_SERVER) /usr/local/bin/
	sudo cp $(TARGET_CLIENT) /usr/local/bin/
	@echo "✅ Installation completed"

# Uninstall from system
uninstall:
	@echo "🗑️ Uninstalling from system..."
	sudo rm -f /usr/local/bin/$(TARGET_SERVER)
	sudo rm -f /usr/local/bin/$(TARGET_CLIENT)
	@echo "✅ Uninstallation completed"

# Clean build artifacts
clean:
	@echo "🧹 Cleaning build artifacts..."
	rm -f $(TARGET_SERVER) $(TARGET_CLIENT)
	rm -f *.o *.d
	@echo "✅ Clean completed"

# Run tests
test: debug
	@echo "🧪 Running tests..."
	@echo "Starting server in background..."
	./$(TARGET_SERVER) &
	SERVER_PID=$$!; \
	sleep 1; \
	echo "Testing client connection..."; \
	echo "SQUARE 5\nSUM 3 7\nEXIT" | ./$(TARGET_CLIENT); \
	kill $$SERVER_PID 2>/dev/null; \
	echo "✅ Tests completed"

# Show version info
version:
	@echo "Distributed Systems Socket Communication Library v$(VERSION)"
	@echo "Build Date: $(BUILD_DATE)"
	@echo "Compiler: $(CC) $(CFLAGS)"

# Package for distribution
package: clean release
	@echo "📦 Creating distribution package..."
	mkdir -p dist/socket-comm-lib-$(VERSION)
	cp $(TARGET_SERVER) $(TARGET_CLIENT) dist/socket-comm-lib-$(VERSION)/
	cp README.md LICENSE Makefile dist/socket-comm-lib-$(VERSION)/
	tar -czf socket-comm-lib-$(VERSION).tar.gz -C dist socket-comm-lib-$(VERSION)
	@echo "✅ Package created: socket-comm-lib-$(VERSION).tar.gz"

# Help
help:
	@echo "Distributed Systems Socket Communication Library Build System"
	@echo "============================================================="
	@echo "Available targets:"
	@echo "  all         - Build release version (default)"
	@echo "  release     - Build optimized release version"
	@echo "  debug       - Build debug version with symbols"
	@echo "  clean       - Remove all build artifacts"
	@echo "  install     - Install to system (/usr/local/bin)"
	@echo "  uninstall   - Remove from system"
	@echo "  test        - Run automated tests"
	@echo "  version     - Show version information"
	@echo "  package     - Create distribution package"
	@echo "  help        - Show this help message"

.PHONY: all release debug clean install uninstall test version package help
