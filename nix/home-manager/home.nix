{pkgs, ...}: {
  home.username = "user";
  home.homeDirectory = "/home/user";
  home.stateVersion = "25.05";

  programs.home-manager.enable = true;
  services.playerctld.enable = true;

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

  home.sessionVariables = {
    EDITOR = "nvim";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    __GL_GSYNC_ALLOWED = "0";
    __GL_VRR_ALLOWED = "0";
  };

  home.packages = [
    (pkgs.papirus-icon-theme.override {color = "black";})
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      icon-theme = "Papirus-Dark";
    };
  };

  xdg.configFile = {
    "xsettingsd/xsettingsd.conf".text = ''
      Net/IconThemeName "Papirus-Dark"
      Gtk/CursorThemeName "Bibata-Modern-Classic"
    '';

    "gtk-3.0/gtk.css".text = ''
      .background {
        background-color: rgba(0, 0, 0, 0.6);
        background-image: none;
      }

      decoration,
      headerbar,
      paned,
      notebook,
      notebook tab,
      notebook header,
      stack,
      stack box,
      overlay,
      box,
      grid,
      scrolledwindow,
      viewport,
      treeview,
      treeview.view,
      .view,
      .sidebar,
      .sidebar row,
      .sidebar separator,
      toolbar,
      toolbar button,
      .path-bar,
      .path-bar button,
      .path-bar button toggle,
      .path-bar button image,
      statusbar,
      separator,
      entry,
      .entry,
      .inline-toolbar,
      dialog,
      dialog box,
      dialog grid,
      dialog notebook,
      dialog notebook tab,
      dialog notebook header,
      dialog scrolledwindow,
      dialog viewport,
      dialog stack,
      dialog stack box,
      .dialog-vbox,
      .dialog-action-area {
        background-color: transparent;
        background-image: none;
        border-color: transparent;
      }

      .view,
      .sidebar label,
      .sidebar row label,
      treeview.view,
      .path-bar button label {
        color: #ffffff;
      }

      entry,
      .entry,
      .path-bar entry,
      .path-bar {
        color: #ffffff;
        caret-color: #ffffff;
      }

      dialog label,
      dialog notebook label,
      dialog tab label,
      dialog entry,
      dialog button label,
      .dialog-vbox label {
        color: #ffffff;
      }

      .view:selected,
      .view:selected label,
      treeview.view:selected {
        color: #ffffff;
        background-color: rgba(100, 150, 255, 0.25);
        border-radius: 6px;
      }

      .view rubberband,
      rubberband,
      .rubberband {
        background-color: rgba(100, 150, 255, 0.2);
        border: 1px solid rgba(100, 150, 255, 0.5);
        border-radius: 4px;
      }
    '';
    "gtk-4.0/gtk.css".text = ''
      .background {
        background-color: rgba(0, 0, 0, 0.6);
        background-image: none;
      }

      decoration,
      headerbar,
      paned,
      notebook,
      notebook tab,
      notebook header,
      stack,
      stack box,
      overlay,
      box,
      grid,
      scrolledwindow,
      viewport,
      columnview,
      columnview row,
      .view,
      .sidebar,
      .sidebar row,
      .sidebar label,
      toolbar,
      toolbar button,
      statusbar,
      separator,
      entry,
      dialog,
      dialog box,
      dialog grid,
      dialog notebook,
      dialog notebook tab,
      dialog notebook header,
      dialog scrolledwindow,
      dialog viewport,
      dialog stack,
      dialog stack box,
      .dialog-vbox,
      .dialog-action-area {
        background-color: transparent;
        background-image: none;
        border-color: transparent;
      }

      .view,
      .sidebar label,
      .sidebar row label,
      .path-bar button label {
        color: #ffffff;
      }

      entry,
      .entry,
      .path-bar entry,
      .path-bar {
        color: #ffffff;
        caret-color: #ffffff;
      }

      dialog label,
      dialog notebook label,
      dialog tab label,
      dialog entry,
      dialog button label,
      .dialog-vbox label {
        color: #ffffff;
      }

      .view:selected,
      .view:selected label {
        color: #ffffff;
        background-color: rgba(100, 150, 255, 0.25);
        border-radius: 6px;
      }

      .view rubberband,
      rubberband {
        background-color: rgba(100, 150, 255, 0.2);
        border: 1px solid rgba(100, 150, 255, 0.5);
        border-radius: 4px;
      }
    '';
  };

  home.pointerCursor = {
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 24;
    x11.enable = true;
  };
}
