verify: lint lint-ansible hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	ansible-galaxy install -r requirements.yml

lint:
	yamllint .

lint-ansible:
	ansible-lint
	ansible-playbook --syntax-check main.yml

hooks:
	pre-commit run --all-files
