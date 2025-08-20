{
  config,
  pkgs,
  user,
  inputs,
  ...
}: {
  imports = [
    inputs.home-manager.nixosModules.default
    ./hardware-configuration.nix
    ../../modules/system/default.nix
  ];

  home-manager = {
    extraSpecialArgs = {inherit user inputs;};
    backupFileExtension = "backup";
    users.${user} = import ./home.nix;
  };

  modules = {
    keyboard = {
      layout = "us";
      variant = "altgr-intl";
    };

    networking = {
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
}
