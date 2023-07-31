
```bash
# nix flake metadata github:ES-Nix/nixosTest/kubernetes
nix \
build \
--no-link \
--print-build-logs \
--print-out-paths \
github:ES-Nix/nixosTest/cf75d2f8233d77fdd52445d7dca97b7b8df8aee6#checks.x86_64-linux.test-nixos
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