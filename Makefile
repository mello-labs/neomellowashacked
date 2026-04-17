.PHONY: all install dev build preview clean help astro-install astro-dev astro-build

PORT ?= 4321

all: build

## install: Install Astro dependencies
install:
	npm --prefix astro install

## dev: Run Astro local dev server
dev:
	npm --prefix astro run dev -- --port "$(PORT)"

## astro-dev: Alias for dev
astro-dev: dev

## build: Build Astro static output
build:
	npm --prefix astro run build

## astro-build: Alias for build
astro-build: build

## preview: Preview Astro production build
preview:
	npm --prefix astro run preview -- --port "$(PORT)"

## astro-install: Alias for install
astro-install: install

## clean: Remove Astro generated artifacts
clean:
	rm -rf astro/dist astro/.astro

## help: Show this help message
help:
	@grep -E '^##' Makefile | sed -e 's/## //'
