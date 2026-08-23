{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--disable-features=BravePrivateWindowTheme"
    ];
    package = pkgs.brave;
    extensions = [
    ];
  };
}
