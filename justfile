set dotenv-load := true

python := env_var_or_default('PYTHON', 'python')
pip := python + " -m pip"
mkdocs := python + " -m mkdocs"

# List available recipes
@default:
    just --list

# Install/upgrade MkDocs, its plugins, and markdown extensions
bootstrap:
    {{ pip }} install mkdocs-material --upgrade
    {{ pip }} install mdx_truly_sane_lists mkdocs-rss-plugin mkdocs-awesome-pages-plugin --upgrade

# Start the live-reloading docs server
serve *ARGS:
    {{ mkdocs }} serve {{ ARGS }}

# Build the docs site
build:
    {{ mkdocs }} build

# Run pre-commit
check *ARGS:
    pre-commit run {{ ARGS }}
