{ pkgs, ... }: {
  nixpkgs.config.allowUnfree = true;

  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    settings.user = {
      name = "Daniel-Cocos";
      email = "dev.danielcocos@gmail.com";
    };
  };

  imports = [
    ./modules/browsers/brave.nix
    ./modules/browsers/firefox.nix
    ./modules/browsers/zen.nix

    ./modules/hypr/hyprland.nix
    ./modules/hypr/hyprlock.nix
    
    ./modules/launchers/rofi.nix

    ./modules/terminal/kitty.nix
    ./modules/terminal/tmux.nix
  ];

  home.packages = with pkgs; [
    sqls
    pyright
    lua51Packages.lua
    (python313.withPackages (
      ps:
        with ps; [
          pylatexenc
          black
          jupyterlab
          ipykernel
          nbconvert
        ]
    ))
    nodePackages.typescript-language-server
    typescript
    vscode-langservers-extracted
    jdt-language-server
    lua-language-server
    nixd
    clang-tools
    marksman
    nodePackages.vscode-langservers-extracted

    # Formatters
    pgformatter
    nodePackages.prettier
    alejandra
    stylua
    google-java-format

    # Linters
    postgresql
    sqlite
    mysql80
    ruff
    nodePackages.eslint_d
    nodePackages.stylelint
    nodePackages.markdownlint-cli
    statix
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
  };

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
}
