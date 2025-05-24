{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.mithril-shell.homeManagerModules.default

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
