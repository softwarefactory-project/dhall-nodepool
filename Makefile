all: freeze lint doc test

check: mypy update

test:
	@bash -c 'for f in $$(find tests/ -name "*.yaml"); do yaml-to-dhall "(./package.dhall).Config.Type" < $$f > /dev/null; done'

mypy:
	@mypy --strict scripts/update.py

update: clean run-update all

run-update:
	@python3 scripts/update.py

clean:
	@rm -f schemas/* *.dhall

freeze:
	@python3 scripts/gen_package.py schemas/  > package.dhall
	@dhall freeze --inplace ./package.dhall --all

lint:
	@bash -c 'for f in $$(find . -name "*.dhall"); do dhall format --ascii < $$f > $$f.fmt; mv $$f.fmt $$f; done'

doc:
	@env DHALL_NODEPOOL=./package.dhall python3 scripts/doc.py
