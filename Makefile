.PHONY: lock
lock:
	nix develop -f default.nix -j8 -v lock

.PHONY: shell
shell:
	nix develop -f default.nix -j8 -i -k TERM -k PATH -k HOME -v shell

.PHONY: build
build:
	dune build @melange