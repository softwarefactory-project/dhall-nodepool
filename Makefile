all: freeze lint doc

check: mypy update

mypy:
	@mypy --strict scripts/update.py

update: run-update all

run-update:
	@python3 scripts/update.py

clean:
	@rm -f schemas/Gce* schemas/Kubernetes* schemas/Open* schemas/Static*

freeze:
	@python3 scripts/gen_package.py schemas/  > package.dhall
	@dhall freeze --inplace ./package.dhall --all

lint:
	@bash -c 'for f in $$(find . -name "*.dhall"); do dhall format --ascii < $$f > $$f.fmt; mv $$f.fmt $$f; done'

doc:
	@env DHALL_NODEPOOL=./package.dhall python3 scripts/doc.py
