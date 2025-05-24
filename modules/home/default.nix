{
  inputs,
  lib,
  pkgs,
  config,
  ...
}: {
  imports = [
    inputs.mithril-shell.homeManagerModules.default
    inputs.hyprpanel.homeManagerModules.hyprpanel

    ./ags
    ./fuzzel
    ./git
    ./hyprland
    ./hyprpanel
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
