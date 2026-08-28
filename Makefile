.PHONY: test test-contract syntax

test: test-contract syntax

test-contract:
	./tests/contract/provider-contract.test.sh

syntax:
	bash -n install.sh upgrade.sh uninstall.sh doctor.sh runtime/*.sh providers/*/*.sh bin/claude-runtime
