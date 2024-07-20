{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    ./ags
    ./git
    ./hyprland
    ./icons
    ./kitty
    ./packages
    ./themes
    ./vscode
  ];

  nixpkgs.config.allowUnfree = true;
}
