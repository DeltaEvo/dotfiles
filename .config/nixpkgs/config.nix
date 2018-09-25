{
  allowUnfree = true;
  allowUnsupportedSystem = true;
  steam.primus = true;
  packageOverrides = pkgs: rec {
    home-manager = import ./home-manager { inherit pkgs; };
  };
}
