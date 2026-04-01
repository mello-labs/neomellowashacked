.PHONY: all install serve dev build build-pages clean update help audit commit

BASEURL ?= /neomello

# Default target
all: build

## install: Install all dependencies (Ruby gems)
install:
	bundle install

## dev: Alias for serve
dev: serve

## serve: Starts the Jekyll development server with live reload and incremental build
serve:
	bundle exec jekyll serve --livereload --incremental

## build: Builds the static site to the _site directory
build:
	bundle exec jekyll build

## build-pages: Builds the site using the GitHub Pages base path
build-pages:
	bundle exec jekyll build --baseurl "$(BASEURL)"

## clean: Removes the generated site and cached files
clean:
	bundle exec jekyll clean

## update: Update gems
update:
	bundle update

## audit: Checks for vulnerabilities in dependencies (requires bundler-audit)
audit:
	@if bundle exec ruby -e "gem 'bundler-audit'" >/dev/null 2>&1; then \
		bundle exec bundler-audit check --update; \
	elif command -v bundler-audit >/dev/null 2>&1; then \
		bundler-audit check --update; \
	else \
		echo "Install bundler-audit first: gem install bundler-audit"; \
	fi

## help: Show this help message
help:
	@grep -E '^##' Makefile | sed -e 's/## //'

## commit: Commit e Push Seguro seguindo o Protocolo NΞØ
commit:
	@echo "🔍 Verificando segurança..."
	@if bundle exec ruby -e "gem 'bundler-audit'" >/dev/null 2>&1; then \
		bundle exec bundler-audit check --update; \
	elif command -v bundler-audit >/dev/null 2>&1; then \
		bundler-audit check --update; \
	else \
		echo "⚠️ Aviso: bundler-audit não instalado. Pulando auditoria local."; \
	fi
	@echo "🔨 Realizando build para validação..."
	@bundle exec jekyll build
	@echo "📝 Status do Git:"
	@git status
	@echo "💡 Sugestão de commit: 'feat: update project configuration' ou 'docs: update readme'"
	@git add .
	@read -p "Digite a mensagem do commit (Conventional Commits): " msg; \
	git commit -m "$$msg"
	@git push origin $$(git rev-parse --abbrev-ref HEAD)
	@echo "✅ Push realizado com sucesso!"
