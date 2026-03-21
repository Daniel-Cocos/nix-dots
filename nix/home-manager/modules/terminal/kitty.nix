{ pkgs, ... }: {
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

      foreground = "#5996ff";
      background = "#000000";
      cursor = "#D0D0D0";

      color0  = "#000000";
      color8  = "#a8c3cc";
      color1  = "#ff4d6d";
      color9  = "#ff4d6d";
      color2  = "#6fcfff";
      color10 = "#6fcfff";
      color3  = "#6ec3e0";
      color11 = "#6ec3e0";
      color4  = "#ff36ab";
      color12 = "#ff36ab";
      color5  = "#5bb6d6";
      color13 = "#5bb6d6";
      color6  = "#6ec3e0";
      color14 = "#6ec3e0";
      color7  = "#8a9aa6";
      color15 = "#8a9aa6";
    };
  };
}
