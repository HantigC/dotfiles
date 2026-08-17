# List of configs to install when running `make setup` / `make install`.
# Each name here must have a matching config/<name>/setup.sh script, and
# becomes installable on its own as `make <name>` (e.g. `make zed`).
# Comment out or remove an entry to skip it.
CONFIGS := \
	vscode \
	ipython \
	zed

.PHONY: setup install list $(CONFIGS)

# Install every config listed in CONFIGS.
setup install: $(CONFIGS)

# Print which configs `make setup` would install.
list:
	@echo "$(CONFIGS)" | tr ' ' '\n'

# Install a single config, e.g. `make zed`.
$(CONFIGS):
	bash config/$@/setup.sh
