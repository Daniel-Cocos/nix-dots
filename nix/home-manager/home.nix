{
  config,
  pkgs,
  lib,
  ...
}: 
let
  androidPackages = pkgs.androidenv.composeAndroidPackages {
    platformToolsVersion = "35.0.1";
    buildToolsVersions = [
      "35.0.0"
      "36.0.0"
    ];
    platformVersions = [
      "35"
      "36"
    ];
    cmdLineToolsVersion = "11.0";
    includeEmulator = true;
    emulatorVersion = "36.3.10";
    includeSystemImages = true;
    systemImageTypes = [ "google_apis_playstore" ];
    abiVersions = [ "x86_64" ];
    includeNDK = true;
    ndkVersion = "27.1.12297006";
    includeCmake = true;
    cmakeVersions = [ "3.22.1" ];
  };
  androidSdk = androidPackages.androidsdk;
  androidSdkPath = "${androidSdk}/libexec/android-sdk";
  androidSdkStablePath = "${config.home.homeDirectory}/.android-sdk";
  androidNdkPath = "${androidSdkStablePath}/ndk/27.1.12297006";
in

{
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.android_sdk.accept_license = true;

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

  home.packages = with pkgs; [
    androidSdk
    # LSP servers
    sqls
    pyright
    lua51Packages.lua
    (python313.withPackages (
      ps:
        with ps; [
          pylatexenc
          black
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
    pgformatter #SQL
    nodePackages.prettier
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
    # Nvidia
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
    # Android
    ANDROID_HOME = androidSdkStablePath;
    ANDROID_SDK_ROOT = androidSdkStablePath;
    ANDROID_NDK_HOME = androidNdkPath;
    ANDROID_NDK_ROOT = androidNdkPath;
    NDK_HOME = androidNdkPath;
  };

  home.sessionPath = [
    "${androidSdkStablePath}/platform-tools"
    "${androidSdkStablePath}/cmdline-tools/latest/bin"
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
  };
  # Copy the SDK to a writable location so Android Studio can create AVDs,
  # download system images, and write other SDK data. The read-only Nix store
  # symlink approach silently blocks these writes, causing "An Android SDK is
  # required to create an AVD" and the AVD wizard Finish button doing nothing.
  home.activation.setupAndroidSdk = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    MARKER="${androidSdkStablePath}/.nix-source"
    if [ ! -d "${androidSdkStablePath}" ] || [ ! -f "$MARKER" ] || [ "$(cat "$MARKER")" != "${androidSdkPath}" ]; then
      $DRY_RUN_CMD rm -rf "${androidSdkStablePath}"
      $DRY_RUN_CMD cp -rL "${androidSdkPath}" "${androidSdkStablePath}"
      $DRY_RUN_CMD chmod -R u+w "${androidSdkStablePath}"
      $DRY_RUN_CMD echo "${androidSdkPath}" > "${androidSdkStablePath}/.nix-source"
    fi
  '';
}
