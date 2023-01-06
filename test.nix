{ pkgs, ... }: {
  # It is an MUST to hava an name!
  # error: The option `name' is used but not defined.
  name = "Fooo";
  nodes = { master = { pkgs, ... }: { }; };

  testScript = ''
    start_all()
    master.succeed("ls -al")
  '';
}