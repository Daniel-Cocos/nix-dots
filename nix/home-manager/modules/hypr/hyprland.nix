{ config, ... }: let
  homeDir = config.home.homeDirectory;
in {
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    xwayland.enable = true;

    settings = {
      monitor = [
        "DP-6,1920x1080@360,auto,1"
      ];

      "exec-once" = [
        "xsettingsd"
        "dconf write /org/gnome/desktop/interface/icon-theme \"'Papirus-Dark'\""
        "hyprctl setcursor Bibata-Modern-Ice 24"
        "hyprlock"
        "swaybg -i ${homeDir}/.wallpapers/wallpaper.png -m fill &"
        "pkill mpvpaper; mpvpaper -o \"loop\" '*' ${homeDir}/.wallpapers/background.mp4"
        "waybar &"
        "qs &"
        "wl-paste --watch cliphist store"
      ];

      windowrule = [
        "match:class ^org.pulseaudio.pavucontrol$, float on"
        "match:class ^org.pulseaudio.pavucontrol$, size 700 600"
        "match:class ^org.pulseaudio.pavucontrol$, center on"
        "match:class ^org.pulseaudio.pavucontrol$, pin on"
      ];

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "LIBVA_DRIVER_NAME,nvidia"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt6ct"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "GDK_SCALE,1"
        "GDK_BACKEND,wayland,x11,*"
        "CLUTTER_BACKEND,wayland"
        "XCURSOR_SIZE,24"
        "APPIMAGELAUNCHER_DISABLE,1"
        "OZONE_PLATFORM,wayland"
        "ELECTRON_OZONE_PLATFORM_HINT,wayland"
        "SDL_VIDEODRIVER,wayland"
      ];

      input = {
        kb_layout = "us";
        kb_variant = "";
        kb_model = "";
        kb_options = "caps:swapescape";
        numlock_by_default = true;
        follow_mouse = 1;
        mouse_refocus = false;
        touchpad = {
          natural_scroll = false;
          scroll_factor = 1.0;
        };
        sensitivity = 0;
      };

      "$background" = "rgb(0d0c0e)";
      "$foreground" = "rgb(acd1db)";
      "$color0" = "rgb(0d0c0e)";
      "$color1" = "rgb(5D5E7C)";
      "$color2" = "rgb(176E8E)";
      "$color3" = "rgb(576C8B)";
      "$color4" = "rgb(A86E87)";
      "$color5" = "rgb(308BA8)";
      "$color6" = "rgb(549CB4)";
      "$color7" = "rgb(acd1db)";
      "$color8" = "rgb(789299)";
      "$color9" = "rgb(5D5E7C)";
      "$color10" = "rgb(176E8E)";
      "$color11" = "rgb(576C8B)";
      "$color12" = "rgb(A86E87)";
      "$color13" = "rgb(308BA8)";
      "$color14" = "rgb(549CB4)";
      "$color15" = "rgb(acd1db)";

      general = {
        gaps_in = 3;
        gaps_out = 7;
        border_size = 0;
        "col.active_border" = "rgba(ffffffff)";
        "col.inactive_border" = "rgba(00000000)";
        layout = "dwindle";
        resize_on_border = true;
      };

      decoration = {
        rounding = 10;
        active_opacity = 1.0;
        inactive_opacity = 0.8;
        fullscreen_opacity = 1.0;
        blur = {
          enabled = true;
          size = 2;
          passes = 1;
          new_optimizations = true;
          ignore_opacity = true;
          xray = true;
        };
        shadow = {
          enabled = false;
          range = 100;
          render_power = 5;
          color = "0x33000000";
        };
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };

      binds = {
        workspace_back_and_forth = true;
        allow_workspace_cycles = true;
        pass_mouse_when_bound = false;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        initial_workspace_tracking = 1;
      };

      layerrule = [
        "match:namespace ^rofi$, blur on"
        "match:namespace ^rofi$, ignore_alpha 0"
        "match:namespace ^waybar$, blur on"
        "match:namespace ^waybar$, ignore_alpha 0"
        "match:namespace ^quickshell$, blur on"
        "match:namespace ^quickshell$, ignore_alpha 0"
      ];

      "$mainMod" = "SUPER";

      bind = [
        "$mainMod, RETURN, exec, kitty"
        "$mainMod, B, exec, brave"
        "$mainMod, E, exec, GTK_THEME=Adwaita-dark thunar"
        "$mainMod, A, exec, qs ipc call launcher toggle"
        "$mainMod, M, exec, spotube"
        "$mainMod, o, exec, pgrep -x \"waybar\" > /dev/null && pkill waybar || (waybar &)"
        "$mainMod, F4, exec, wlogout -b 5 -T $(( $(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height') / 4 )) -B $(( $(hyprctl -j monitors | jq '.[] | select(.focused==true) | .height') / 4 ))"
        "$mainMod, s, exec, ${homeDir}/.scripts/screenshot_region.sh"
        "$mainMod, w, exec, ${homeDir}/.scripts/wifi-menu.sh"
        "$mainMod, v, exec, ${homeDir}/.scripts/voice_input.sh"
        "$mainMod, p, exec, playerctl previous"
        "$mainMod, SPACE, exec, playerctl play-pause"
        "$mainMod, n, exec, playerctl next"
        "$mainMod, Q, killactive"
        "$mainMod SHIFT, Q, exec, hyprctl activewindow | grep pid | tr -d 'pid:' | xargs kill"
        "$mainMod, F, fullscreen, 0"
        "$mainMod, T, togglefloating"
        "$mainMod SHIFT, T, workspaceopt, allfloat"
        "$mainMod, h, movefocus, l"
        "$mainMod, l, movefocus, r"
        "$mainMod, k, movefocus, u"
        "$mainMod, j, movefocus, d"
        "$mainMod SHIFT, l, resizeactive, 50 0"
        "$mainMod SHIFT, h, resizeactive, -50 0"
        "$mainMod SHIFT, j, resizeactive, 0 50"
        "$mainMod SHIFT, k, resizeactive, 0 -50"
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"
        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"
        ", XF86MonBrightnessUp, exec, brightnessctl -q s +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl -q s 10%-"
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        "SUPER, DOWN, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        "SUPER, UP, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"
        ", XF86Lock, exec, hyprlock"
        ", code:238, exec, brightnessctl -d smc::kbd_backlight s +10"
        ", code:237, exec, brightnessctl -d smc::kbd_backlight s 10-"
      ];

      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];

      animations = {
        enabled = true;
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.0"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
        ];
        animation = [
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 4, winIn, slide"
          "windowsOut, 1, 4, winOut, slide"
          "windowsMove, 1, 4, wind, slide"
          "border, 1, 5, liner"
          "borderangle, 1, 30, liner, once"
          "fade, 1, 5, default"
          "workspaces, 1, 3.5, wind"
        ];
      };
    };
  };
}
