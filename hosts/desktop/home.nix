{
  lib,
  inputs,
  config,
  ...
}: {
  imports = [
    ../../modules/home/default.nix
  ];

  home.username = "korazza";
  home.homeDirectory = "/home/korazza";

  modules = {
    ags.enable = false;
    fuzzel.enable = true;
    git.enable = true;
    hyprland.enable = true;
    icons.enable = true;
    kitty.enable = true;
    mithril-shell.enable = true;
    packages.enable = true;
    themes.enable = true;
    vscode.enable = true;
    waybar.enable = false;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
