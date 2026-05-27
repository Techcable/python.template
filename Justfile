test: mypy _ty _lint && check-format
    # Testing project
    @just _test

# Run test just on the current python version
test-single:
    # Test on current python version
    uv run pytest

check: mypy lint

# runs lints and `ty`, but not `mypy` or tests
#
# Avoids performance penalty of `mypy`
lint: _ty _lint && check-format

_lint: _ruff
_ruff:
    -ruff check src

fix: && _format fix-spelling
    @# Failure to fix should not prevent formatting
    -ruff check --fix src

build: mypy && _test check-format
    # Build project
    uv build

ty: _ty && _ruff

_ty:
    uv run ty check

mypy:
    uv run mypy src

# runs tests without anything else
_test:
    hatch test --all


# Check for spelling issues
spellcheck:
    # Check for obvious spelling issues
    uv run typos

# Fix obvious spelling issues
fix-spelling:
    # Fix obvious spelling issues
    uv run typos --write-changes

# Checks for formatting issues
check-format: && spellcheck
    @# Invoking ruff directly instead of through uv tool run saves ~12ms per command,
    @# reducing format --check src time from ~20ms to ~8ms.
    @# it reduces time for `ruff --version` from ~16ms to ~3ms.
    @# Running through `uv tool run` also frequently requires refresh of
    @# project dependencies, which can add an additional 100+ ms
    ruff format --check .
    ruff check --select I --output-format concise .
    # check toml formatting
    uv run tombi format --check

format: _format && spellcheck

_format:
    ruff format .
    ruff check --select 'I' --fix .
    # format toml
    uv run tombi format
