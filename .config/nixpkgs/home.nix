{ config, pkgs, ... }:

let 
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  minecraft = pkgs.minecraft.override { useAlsa = true; };
  python3 = pkgs.python36.withPackages (ps : [ps.numpy]);
  winetricks = pkgs.winetricks.override { wine = pkgs.wineStaging; };
  sysconfig = (import <nixpkgs/nixos> {}).config;
in
{
  home.packages = with pkgs; ([
    manpages
    htop
    ntfs3g
    nodejs-8_x
    tmux
    acpi
    powertop
    git
    sshpass
    psmisc
    pciutils
    tor
    torsocks
    fortune
    ponysay
    rustup
    wget
    valgrind
    cmatrix
    unrar
    unzip
    neovim
    emacs
    universal-ctags
    python3
    gdb
    gnumake
    cmake
    pkgconfig
  ] ++ pkgs.lib.optionals sysconfig.services.xserver.enable [
    feh
    glxinfo
    albert
    units
    polybar
    vscode
#    steam
    discord
#    tdesktop
    minecraft
    yubikey-personalization-gui
    yubioath-desktop
#    spotify
    lxqt.qterminal
    conky
    i3lock
    firefox-devedition-bin
    winetricks
    electrum
  ]);
  gtk = {
    enable = true;
    theme = {
      package = pkgs.arc-theme;
      name = "Arc-Dark";
    };
    iconTheme = {
      package = pkgs.papirus-icon-theme;
      name = "Papirus-Dark";
    };
  };
  systemd.user.services.emacsd = {
    Unit = {
      Description = "Emacs: the extensible, self-documenting text editor";
    };

    Service = {
      Type = "forking";
      ExecStart = "${pkgs.emacs}/bin/emacs --daemon";
      ExecReload = "${pkgs.emacs}/bin/emacsclient --eval \"(kill-emacs)\"";
      Environment = ''
        PATH=${pkgs.xclip}/bin:${pkgs.coreutils}/bin
      '';
      Restart = "always";
    };

    Install = {
        WantedBy = [ "default.target" ];
    };
  };
}
