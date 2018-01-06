{ config, pkgs, ... }:

let 
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  minecraft = pkgs.minecraft.override { useAlsa = true; };
  python3 = pkgs.python36.withPackages (ps : [ps.numpy]);
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
    clang
  ] ++ pkgs.lib.optionals sysconfig.services.xserver.enable [
    arc-theme
    papirus-icon-theme
    glxinfo
    albert
    units
    polybar
    vscode
    steam
    #    discord
    tdesktop
    minecraft
    yubikey-personalization-gui
    yubioath-desktop
    spotify
    lxqt.qterminal
    conky
    i3lock
    firefox-devedition-bin
  ]);
  gtk = {
    enable = true;
    themeName = "Arc-Dark";
    iconThemeName = "Papirus-Dark";
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
        PATH=${pkgs.xclip}/bin
      '';
      Restart = "always";
    };

    Install = {
        WantedBy = [ "default.target" ];
    };
  };
}
