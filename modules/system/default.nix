{
  inputs,
  user,
  language,
  timeZone,
  pkgs,
  lib,
  config,
  ...
}: {
  imports = [
    ./bluetooth
    ./greetd
    ./i18n
    ./keyboard
    ./keyring
    ./networking
    ./nh
    ./notifications
    ./polkit
    ./shell
    ./sound
    ./stylix
  ];

  modules = {
    bluetooth.enable = lib.mkDefault true;

    greetd.enable = lib.mkDefault true;

    i18n = {
      enable = lib.mkDefault true;
      language = language;
    };

    keyring.enable = lib.mkDefault true;

    networking = {
      enable = lib.mkDefault true;
      wireless.enable = lib.mkDefault true;
    };

    nh.enable = lib.mkDefault true;

    notifications.enable = lib.mkDefault true;

    sound.enable = lib.mkDefault true;

    polkit.enable = lib.mkDefault true;

    shell = {
      enable = lib.mkDefault true;
      fish.enable = lib.mkDefault true;
    };

    stylix.enable = lib.mkDefault true;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  nixpkgs.config.allowUnfree = true;

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    consoleLogLevel = 3;
    initrd.verbose = false;

    plymouth = {
      enable = true;
      themePackages = with pkgs; [
        adi1090x-plymouth-themes
      ];
      theme = "rog_2";
    };

    supportedFilesystems = ["ntfs"];
  };

  users.users.${user} = {
    isNormalUser = true;
    uid = 1000;
    description = "${user}";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
  };

  time = {
    hardwareClockInLocalTime = true;
    timeZone = timeZone;
  };

  services = {
    printing.enable = true;
    xserver.enable = true;
    gvfs.enable = true;
  };

  system.stateVersion = "23.11";
}
