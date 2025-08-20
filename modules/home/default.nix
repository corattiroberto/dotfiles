{
  inputs,
  lib,
  pkgs,
  config,
  secrets,
  ...
}: {

  # home.sessionVariables = {
  #   WEATHER_API_KEY = secrets.weatherApiKey;
  # };

  imports = [
    inputs.mithril-shell.homeManagerModules.default

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
