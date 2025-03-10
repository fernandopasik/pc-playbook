venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements.txt
	ansible-galaxy install -r requirements.yml

lint:
	yamllint .

lint-ansible:
	ansible-lint
	ansible-playbook --syntax-check main.yml

verify: lint lint-ansible
