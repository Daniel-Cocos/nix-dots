{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
  ];

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

  virtualisation.docker.enable = true;

  users.users.user = {
    extraGroups = [ "docker" ];
  };

  networking.firewall.allowedUDPPorts = [ 27005 27015 27020 ];

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
    steamcmd
    mangohud
    gamemode
  ];
  
  # Optional: enable the server to run as a service (see step 4)
  systemd.services.steamcmd-server = {
    description = "CS2 Dedicated Server";
    after = [ "network.target" ];

    serviceConfig = {
      ExecStart = "${pkgs.steamcmd}/bin/steamcmd +login anonymous +force_install_dir /opt/cs2_server +app_update 1009000 validate";
      WorkingDirectory = "/opt/cs2_server";
      Restart = "always";
    };
  };
  programs.gamemode.enable = true;
}
