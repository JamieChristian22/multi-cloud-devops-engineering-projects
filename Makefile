.PHONY: validate inventory
validate:
	bash scripts/validate-all.sh
inventory:
	find . -type f | sort
