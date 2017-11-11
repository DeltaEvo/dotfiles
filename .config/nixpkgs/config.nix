{
  allowUnfree = true;
  steam.primus = true;
  packageOverrides = pkgs: rec {
    home-manager = import ./home-manager { inherit pkgs; };
    python3 = pkgs.python3.withPackages (ps : [ps.numpy]);
  };
  # chromium = { enablePepperFlash = true; };
}
