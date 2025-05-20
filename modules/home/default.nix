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
    ./mithril-shell
    ./packages
    ./themes
    ./vscode
    ./waybar
  ];

  nixpkgs.config.allowUnfree = true;
}
