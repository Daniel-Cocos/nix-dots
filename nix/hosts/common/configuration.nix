{
  pkgs,
  inputs,
  ...
}: {
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.networkmanager.enable = true; # Networking

  time.timeZone = "Europe/London"; # Time zone

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

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  # User account
  users.users.user = {
    isNormalUser = true;
    description = "user";
    extraGroups = ["networkmanager" "wheel" "kvm" "adbusers"];
    shell = pkgs.zsh;
  };

  nixpkgs.config.allowUnfree = true; # Allow unfree packages
  nix.settings.experimental-features = ["nix-command" "flakes"]; # Enable flakes

  home-manager = {
    extraSpecialArgs = {inherit inputs;};
    users."user" = {imports = [../../home-manager/home.nix];};
  };

  environment.variables = {
    TERMINAL = "kitty";
  };

  programs.zsh.enable = true;
  programs.npm.enable = true;
  programs.hyprland.enable = true;
  services.xserver.enable = false;
  services.getty.autologinUser = "user";

  services.playerctld.enable = true;

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glib
      gtk3
      nss
      nspr
      dbus
      cups
      atk
      cairo
      pango
      gdk-pixbuf
      alsa-lib
      libdrm
      mesa
      libgbm
      libxkbcommon
      libX11
      libXcomposite
      libXdamage
      libXfixes
      libXrandr
      libXtst
      libXScrnSaver
      libxcb
      libXcursor
      libXi
      libXrender
      libXext
      at-spi2-atk
      expat
      fontconfig
      freetype
      libuuid
      libnotify
      libxcb

      stdenv.cc.cc.lib
      zlib
      glib
      libxml2
      libxslt
    ];
  };

  # System packages
  environment.systemPackages = with pkgs; [
    # Music
    playerctl
    spotube

    # Existing
    texlive.combined.scheme-full # Full TeX Live distribution
    pandoc
    opencode
    discord

    # TTS/STT
    wtype
    piper-tts
    ffmpeg

    # Languages / LSPs
    sqls
    pyright
    lua51Packages.lua
    (python313.withPackages (ps:
      with ps; [
        pylatexenc
        black
        jupyterlab
        ipykernel
        nbconvert
      ]))
    nodePackages.typescript-language-server
    typescript
    vscode-langservers-extracted
    jdt-language-server
    lua-language-server
    nixd
    clang-tools
    marksman

    # Formatters
    pgformatter
    nodePackages.prettier
    alejandra
    stylua
    google-java-format

    # Linters / DB tools
    postgresql
    sqlite
    mysql80
    ruff
    nodePackages.eslint_d
    nodePackages.stylelint
    nodePackages.markdownlint-cli
    statix
    # File explorer
    pkgs.thunar
    pkgs.xfconf
    xsettingsd
    papirus-icon-theme

    ninja
    openjdk
    poetry
    mprocs
    gnumake
    clang-tools
    gopls
    nodePackages.vscode-json-languageserver # jsonls
    lua-language-server # lua_ls
    marksman # marksman
    pyright
    rust-analyzer
    sqls
    nodePackages.typescript-language-server # tsserver
    yaml-language-server # yamlls

    # Formatters & Linters (from mason-null-ls)
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
    noto-fonts-color-emoji
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
