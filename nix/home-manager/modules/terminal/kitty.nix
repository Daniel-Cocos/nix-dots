{pkgs, ...}: {
  programs.kitty = {
    enable = true;
    package = pkgs.kitty;

    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };

    settings = {
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      remember_window_size = false;
      initial_window_width = 950;
      initial_window_height = 500;

      cursor_blink_interval = 1;
      cursor_stop_blinking_after = 0;

      scrollback_lines = -1;
      wheel_scroll_min_lines = 1;

      enable_audio_bell = false;
      window_padding_width = 10;
      hide_window_decorations = true;

      background_opacity = 0.6;
      dynamic_background_opacity = false;

      confirm_os_window_close = 0;

      selection_foreground = "none";
      selection_background = "none";

      scrollbar_width = 0;

      foreground = "#6b748f";
      background = "#000000";
      cursor = "#D4D9DC";

      color0 = "#6b748f";
      color1 = "#ff5c7a";
      color2 = "#4885ff";
      color3 = "#ffc857";
      color4 = "#4885ff";
      color5 = "#ff3ea5";
      color6 = "#6b748f";
      color7 = "#6b748f";

      color8 = "#6b748f";
      color9 = "#ff5c7a";
      color10 = "#9f8cff";
      color11 = "#ffc857";
      color12 = "#4885ff";
      color13 = "#ff3ea5";
      color14 = "#6be6ff";
      color15 = "#dfe3ff";
    };
  };
}
