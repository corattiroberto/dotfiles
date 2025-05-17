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
  ];

  nixpkgs.config.allowUnfree = true;
}
