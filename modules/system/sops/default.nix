{
  inputs,
  pkgs,
  lib,
  user,
  config,
  ...
}: let
  cfg = config.modules.sops;
in {
  options.modules.sops = {
    enable = lib.mkEnableOption "Enable SOPS";
    # options
  };

  config = lib.mkIf cfg.enable {
    
    sops = {
      defaultSopsFile = ../../../secrets/secrets.json;
      defaultSopsFormat = "json";

      age.keyFile = "/home/${user}/.config/sops/age/keys.txt";
    
      secrets = {
        weather_api_key = {
          owner = user;
        };
      };
    };
  };
}
