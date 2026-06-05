# Run `just` to list commands. Requires: uv, just.

# Show available commands
default:
    @just --list

# Create venv, install all deps, install git hooks
bootstrap:
    uv sync
    uv run pre-commit install

# Install / update dependencies from pyproject.toml
sync:
    uv sync

# Auto-format the codebase
fmt:
    uv run ruff format .
    uv run ruff check --fix .

# Lint (ruff). Use `just fmt` to auto-fix.
lint:
    uv run ruff check .
    uv run ruff format --check .

# Static type check
type:
    uv run mypy

# Run the test suite
test *ARGS:
    uv run pytest {{ARGS}}

# Lint + type-check + test (the full local gate)
check: lint type test

# Run all pre-commit hooks against all files
hooks:
    uv run pre-commit run --all-files

# Build sdist + wheel into dist/
build:
    uv build


# Serve docs locally with live reload
docs:
    uv run mkdocs serve

# Build the static docs site into site/
docs-build:
    uv run mkdocs build

# Remove build/test/cache artifacts
clean:
    rm -rf dist build .pytest_cache .ruff_cache .mypy_cache htmlcov .coverage coverage.xml site
    find . -type d -name __pycache__ -exec rm -rf {} +
