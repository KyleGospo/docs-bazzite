export PATH := justfile_directory() + "/utils:" + env("PATH")
export GITHUB_REPOSITORY := "ublue-os/bazzite"
export MKDOCS_REPO_URL := "https://github.com/" + GITHUB_REPOSITORY
MKDOCS_DIR := justfile_directory()

_default:
    just --list

# Install dependencies required for documentation stuff
install_dependencies:
    bash ./utils/install-deps.sh

mkdocs +ARGS="":
    rm -rf {{ MKDOCS_DIR }}/.cache/cmdrun
    uv run mkdocs {{ ARGS }}

mkdocs_clean:
    rm -rf {{ MKDOCS_DIR }}/.cache

# Format all markdown files with prettier
fmt:
    prettier --check --write $(find src -type f -name '*.md')

# Fix headers
_fmt-headers:
    rg '^#\s' src/ --json \
    | jq -rs '.[] | select(.type=="end") | {file: .data.path.text, number: .data.stats.matches} | select(.number > 1) | .file' \
    | xargs -I{} sed -i -E 's/(^#+) /\1# /' {}
