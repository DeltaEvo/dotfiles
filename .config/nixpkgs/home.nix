{ config, pkgs, ... }:

let 
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  minecraft = pkgs.minecraft.override { useAlsa = true; };
  python3 = pkgs.python36.withPackages (ps : [ps.numpy]);
  sysconfig = (import <nixpkgs/nixos> {}).config;
in
{
  home.packages = with pkgs; ([
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
    universal-ctags
    python3
    gcc
    gnumake
    cmake
    pkgconfig
  ] ++ pkgs.lib.optionals sysconfig.services.xserver.enable [
    arc-theme
    papirus-icon-theme
    glxinfo
    albert
    units
    polybar
    vscode
    steam
    discord
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
}
