{
  config,
  pkgs,
  ...
}: {
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";

  # Let Home Manager manage itself
  programs.home-manager.enable = true;

  # Git configuration
  programs.git = {
    enable = true;
    userName = "Daniel-Cocos";
    userEmail = "dev.danielcocos@gmail.com";
  };

  imports = [
    ./modules/browsers/brave.nix
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  home.packages = with pkgs; [
    # LSP servers
    sqls
    pyright
    lua51Packages.lua
    (python314.withPackages (
      ps:
        with ps; [
          pylatexenc
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

    # Formatters
    pgformatter #SQL
    nodePackages.prettier
    python3Packages.black
    alejandra
    stylua
    google-java-format

    # Linters
    postgresql
    sqlite #sqlite
    mysql80
    ruff
    nodePackages.eslint_d
    nodePackages.stylelint
    nodePackages.markdownlint-cli
    statix
  ];

  # Session variables
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
