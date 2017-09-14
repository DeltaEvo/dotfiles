{ pkgs, ... }:

let 
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };
  minecraft = pkgs.minecraft.override { useAlsa = true; };
in
{
  home.packages = with pkgs; [
#    arc-theme
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
    glxinfo
    tor
    torsocks
    konsole
    albert
    polybar
    fortune
    ponysay
    chromium
    thunderbird
    rustup
    neovim
    vscode
    steam
    discord
    tdesktop
    minecraft
    yubikey-personalization-gui
    wget
    yubioath-desktop
    valgrind
    cmatrix
    unrar
    unzip
    spotify
    lxqt.qterminal
    universal-ctags
    conky
    i3lock
  ];
  gtk = {
    enable = true;
    themeName = "Arc-Dark";
  };
}
