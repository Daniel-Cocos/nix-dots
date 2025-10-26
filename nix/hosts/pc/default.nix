{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
  ];

  # PC-specific configuration
  networking.hostName = "pc";

  # NVIDIA stuff
  services.xserver.videoDrivers = [ "nvidia" ];
  
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false; # Use proprietary drivers?
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Additional packages for steam and stuff
  environment.systemPackages = with pkgs; [
    steam
    steam-run
    mangohud
    gamemode
  ];

  # Enable gamemode
  programs.gamemode.enable = true;
}
