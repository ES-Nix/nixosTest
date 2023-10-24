
```bash
# nix flake metadata github:ES-Nix/nixosTest/kubernetes
nix \
build \
--no-link \
--print-build-logs \
--print-out-paths \
--refresh \
github:ES-Nix/nixosTest/05c4704de9cdf64d6f6989772175568cd2598868#checks.x86_64-linux.test-nixos
```


```bash
nix \
flake \
lock \
--override-input nixpkgs github:NixOS/nixpkgs/ea4c80b39be4c09702b0cb3b42eab59e2ba4f24b
```

```bash
nix \
build \
--no-link \
--print-build-logs \
--print-out-paths \
--refresh \
github:ES-Nix/nixosTest/kubernetes#checks.x86_64-linux.test-nixos

nix \
build \
--no-link \
--print-build-logs \
--print-out-paths \
--rebuild \
github:ES-Nix/nixosTest/kubernetes#checks.x86_64-linux.test-nixos
```


```bash
nix \
flake \
clone github:ES-Nix/nixosTest/kubernetes \
--dest nixosTest/ \
&& cd nixosTest 1> /dev/null 2> /dev/null \
&& ((direnv 1>/dev/null 2>/dev/null && direnv allow) || nix develop .#)
```


```bash
git clone https://github.com/ES-Nix/nixosTest.git \
&& cd nixosTest \
&& git checkout kubernetes \
&& nix build .#checks.x86_64-linux.test-nixos
```


```bash
echo 'Start kvm stuff...' \
&& getent group kvm || sudo groupadd kvm \
&& sudo usermod --append --groups kvm "$USER" \
&& sudo -k chown "$(id -u)"':'"$(id -g)" /dev/kvm \
&& echo 'End kvm stuff!'
```



TODO:

``` python
@polling_condition(seconds_interval=0.2)
def test_if_certmgr_is_running():
    machine.succeed("systemctl is-active certmgr.service")
```