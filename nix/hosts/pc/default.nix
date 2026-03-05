{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../common/configuration.nix
  ];

  nix.settings.download-buffer-size = 134217728;
  networking.hostName = "pc";

  # NVIDIA settings
  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Ensure graphics are enabled
  hardware.graphics.enable = true;

  virtualisation.docker.enable = true;

  users.users.user = {
    extraGroups = ["docker"];
  };

  networking.firewall.allowedUDPPorts = [27005 27015 27020];

  # Steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  # Locally hosted LLM
  services.ollama = {
    enable = true;
    package = pkgs.ollama-cuda;
    loadModels = ["qwen3.5:9b"];
  };

  # Additional packages
  environment.systemPackages = with pkgs; [
    (whisper-cpp.override {cudaSupport = true;})
    steam
    steam-run
    steamcmd
    mangohud
    gamemode
  ];

  # Steam server
  systemd.services.steamcmd-server = {
    description = "CS2 Dedicated Server";
    after = ["network.target"];
    serviceConfig = {
      ExecStart = "${pkgs.steamcmd}/bin/steamcmd +login anonymous +force_install_dir /opt/cs2_server +app_update 1009000 validate";
      WorkingDirectory = "/opt/cs2_server";
      Restart = "always";
    };
  };
  programs.gamemode.enable = true;
}
