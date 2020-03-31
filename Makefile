all: lint test

test:
	env DHALL_NODEPOOL=$$(pwd)/package.dhall dhall-to-yaml --explain --file demo/config.dhall > demo/generated_nodepool_config.yaml

lint:
	@bash -c 'for f in $$(find . -name "*.dhall"); do dhall format --ascii < $$f > $$f.fmt; mv $$f.fmt $$f; done'
