{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./ags
    ./fuzzel
    ./git
    ./hyprland
    ./icons
    ./kitty
    ./packages
    ./themes
    ./vscode
    ./waybar
  ];

  nixpkgs.config.allowUnfree = true;
}
