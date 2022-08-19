{ pkgs, ... }: {
  nodes = {
    machine = { machine, pkgs, ... }: {
      virtualisation = {
        memorySize = 1024 * 3;
        diskSize = 1024 * 3;
        cores = 4;
        msize = 104857600;
      };
      services.kubernetes = {
        roles = ["master" "node"];
        # If you use swap:
        # kubelet.extraOpts = "--fail-swap-on=false";
        # masterAddress = "nixos";
        masterAddress = "localhost";
      };

      # Is this ok to kubernetes?
      # Why free -h still show swap stuff but with 0?
      swapDevices = pkgs.lib.mkForce [ ];
      boot.kernelParams = [
        "swapaccount=0"
        "systemd.unified_cgroup_hierarchy=0"
        "group_enable=memory"
        "cgroup_enable=cpuset"
        "cgroup_memory=1"
        "cgroup_enable=memory"
      ];
    };
  };

  # Disable linting for simpler debugging of the testScript
  skipLint = true;

  testScript = ''
    import time


    start_all()

    machine.start()

    # let the system boot up
    machine.wait_for_unit("multi-user.target")

    for i in range(10*60*2):
        try:
            machine.succeed("systemctl is-active certmgr.service")
        except:
            print("The current time is:", i)
            time.sleep(0.5)

    machine.succeed("systemctl is-active certmgr.service")
  '';
}