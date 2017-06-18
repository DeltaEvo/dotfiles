{ pkgs, ... }:

let 
  polybar = pkgs.polybar.override { i3GapsSupport = true; githubSupport = true; mpdSupport = true; };

in
{
  home.packages = with pkgs; [
    arc-theme
    htop
    ntfs3g
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
  ];
  gtk = {
    enable = true;
    themeName = "Arc-Dark";
  };
}
