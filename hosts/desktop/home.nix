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
    ags.enable = true;
    git.enable = true;
    hyprland.enable = true;
    icons.enable = true;
    kitty.enable = true;
    packages.enable = true;
    themes.enable = true;
    vscode.enable = true;
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
