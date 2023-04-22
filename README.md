

```bash
nix \
build \
--no-link \
--print-build-logs \
github:ES-Nix/nixosTest/2f37db3fe507e725f5e94b42a942cdfef30e5d75#checks.x86_64-linux.test-nixos


time \
nix \
build \
--no-link \
--print-build-logs \
--rebuild \
github:ES-Nix/nixosTest/2f37db3fe507e725f5e94b42a942cdfef30e5d75#checks.x86_64-linux.test-nixos
```

```bash
nix \
flake \
clone github:ES-Nix/nixosTest/minimal-working-example \
--dest nixosTest/
```


```bash
git clone https://github.com/ES-Nix/nixosTest.git
cd nixosTest
git checkout 2f37db3fe507e725f5e94b42a942cdfef30e5d75
nix build .#checks.x86_64-linux.test-nixos
```
