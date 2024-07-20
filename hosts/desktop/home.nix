{
  lib,
  inputs,
  config,
  ...
}: {
  imports = [
    ../../modules/home/default.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
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

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
