verify: format lint lint-ansible check hooks

venv:
	@python -m venv .venv
	@echo 'run `. .venv/bin/activate` to develop'

install:
	pip install -r requirements-dev.txt
	pre-commit install
	ansible-galaxy install -r requirements.yml

check:
	nix flake check

format:
	pre-commit run --all-files yamlfmt
	mdformat .
	nix shell nixpkgs#nixfmt-rfc-style -c sh -c 'find . -name "*.nix" -exec nixfmt --strict {} +'

lint:
	yamllint .
	nix shell nixpkgs#statix -c statix check

lint-ansible:
	ansible-lint
	ansible-playbook --syntax-check main.yml

hooks:
	pre-commit run --all-files

start:
	ansible-playbook main.yml

run:
	sudo nixos-rebuild switch --flake .#uac --refresh
