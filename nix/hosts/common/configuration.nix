{ config, pkgs, inputs, ... }:

{
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.networkmanager.enable = true;

  # Time zone
  time.timeZone = "Europe/London";

  # Locale settings
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # User account
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # LSP
  programs.npm.enable = true;

  home-manager = {
      extraSpecialArgs = { inherit inputs; };
      users."user" = { imports = [ ../../home-manager/home.nix ]; };
    };

  # Hyprland
  programs.hyprland.enable = true;
  services.xserver.enable = false;
  services.getty.autologinUser = "user";

  # System packages
  environment.systemPackages = with pkgs; [
    ninja
    openjdk
    poetry
    mprocs
    gnumake
    clang-tools
    gopls
    nodePackages.vscode-json-languageserver # jsonls
    lua-language-server # lua_ls
    marksman          # marksman
    pyright
    rust-analyzer
    sqls
    nodePackages.typescript-language-server # tsserver
    yaml-language-server # yamlls
    
    # --- Formatters & Linters (from mason-null-ls) ---
    isort
    pylint
    nodePackages.stylelint
    stylua

    grim
    slurp

    luarocks
    python314
    gcc
    tree
    jq
    neovim
    git
    mpvpaper
    hyprland
    wget
    brightnessctl
    curl
    deno
    eslint
    eslint_d
    eza
    fzf
    fd
    gimp
    go
    htop
    kitty
    libreoffice
    lua
    nautilus
    obs-studio
    oh-my-posh
    pamixer
    pavucontrol
    ripgrep
    rofi
    tk
    tmux
    tokei
    typescript
    unzip
    vlc
    wlogout
    yazi
    zip
    zoxide
    zsh
    noto-fonts
    noto-fonts-emoji
    noto-fonts-extra
    hyprshot
    waybar
    swaybg
    hyprlock
    wl-clipboard
    xdg-desktop-portal-hyprland
    xdg-desktop-portal
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];

  system.stateVersion = "25.05";
}
