all: lint

test:
	@dhall-to-yaml --omit-empty --explain --file nodepool.dhall

lint:
	@bash -c 'for f in $$(find . -name "*.dhall"); do dhall format --ascii < $$f > $$f.fmt; mv $$f.fmt $$f; done'

