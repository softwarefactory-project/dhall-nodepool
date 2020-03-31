all: freeze lint doc demo

.PHONY: demo
demo:
	@env DHALL_NODEPOOL=$$(pwd)/package.dhall dhall-to-yaml --explain --file demo/config.dhall > demo/generated_nodepool_config.yaml

freeze:
	@python3 scripts/gen_package.py schemas/  > package.dhall
	@dhall freeze --inplace ./package.dhall --all

lint:
	@bash -c 'for f in $$(find . -name "*.dhall"); do dhall format --ascii < $$f > $$f.fmt; mv $$f.fmt $$f; done'

doc:
	@env DHALL_NODEPOOL=./package.dhall python3 scripts/doc.py
