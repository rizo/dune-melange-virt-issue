# dune-melange-virt-issue

See: https://github.com/ocaml/dune/issues/7104

## Usage

Start a shell (requires [Nix](https://nixos.org/download.html)):
```
$ make shell
```

Build the native target:
```
$ dune build
File "src/dune_rules/virtual_rules.ml", line 11, characters 30-37:
Error: No rule found for vlib/.vlib.objs/byte/virt.cmi
File "src/dune_rules/virtual_rules.ml", line 11, characters 30-37:
Error: No rule found for vlib/.vlib.objs/byte/vlib.cmi
File "src/dune_rules/virtual_rules.ml", line 11, characters 30-37:
Error: No rule found for vlib/.vlib.objs/byte/vlib.cmo
File "src/dune_rules/virtual_rules.ml", line 11, characters 30-37:
Error: No rule found for vlib/.vlib.objs/native/vlib.cmx
File "src/dune_rules/virtual_rules.ml", line 11, characters 30-37:
Error: No rule found for vlib/.vlib.objs/native/vlib.o
```

Commenting out `(modes melange)` in `vlib/dune`, allows compiling the native target.


Build the melange target:
```
File "vlib/vlib.ml", line 1:       
Error: Virt not found, it means either the module does not exist or it is a namespace
```

## 
```
