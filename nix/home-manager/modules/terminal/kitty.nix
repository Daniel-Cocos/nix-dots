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

      background_opacity = "0.6";
      dynamic_background_opacity = false;

      confirm_os_window_close = 0;

      selection_foreground = "none";
      selection_background = "none";

      scrollbar_width = 0;

      foreground = "#6B748F";
      background = "#000000";
      cursor = "#D4D9DC";

      color0 = "#6B748F";
      color1 = "#FF5C7A";
      color2 = "#4885FF";
      color3 = "#FFC857";
      color4 = "#4885FF";
      color5 = "#FF3EA5";
      color6 = "#6B748F";
      color7 = "#6B748F";

      color8 = "#6B748F";
      color9 = "#FF5C7A";
      color10 = "#9F8CFF";
      color11 = "#FFC857";
      color12 = "#4885FF";
      color13 = "#FF3EA5";
      color14 = "#00FF00";
      color15 = "#00FF00";

      tab_bar_edge = "top";
      tab_bar_style = "separator";
      tab_separator = "\" \"";
      tab_bar_min_tabs = 1;

      tab_title_template = "\"{index}\"";
      active_tab_title_template = "\"{index}\"";

      tab_bar_margin_width = "10.0";
      tab_bar_margin_height = "5 0";

      active_tab_foreground = "#FFFFFF";
      active_tab_background = "#000000";
      active_tab_font_style = "normal";

      inactive_tab_foreground = "#CCCCCC";
      inactive_tab_background = "#000000";
      inactive_tab_font_style = "normal";

      # Split divider line colors
      active_border_color   = "#FFFFFF";
      inactive_border_color = "#FFFFFF";

      tab_bar_background = "#000000";

      enabled_layouts = "splits:split_axis=horizontal,stack";
    };

    keybindings = {
      "alt+shift+h" = "previous_tab";
      "alt+shift+l" = "next_tab";
      "alt+space" = "new_tab";
      "alt+shift+w" = "close_window";

      "alt+shift+1" = "goto_tab 1";
      "alt+shift+2" = "goto_tab 2";
      "alt+shift+3" = "goto_tab 3";
      "alt+shift+4" = "goto_tab 4";
      "alt+shift+5" = "goto_tab 5";
      "alt+shift+6" = "goto_tab 6";
      "alt+shift+7" = "goto_tab 7";
      "alt+shift+8" = "goto_tab 8";

      "ctrl+shift+h" = "neighboring_window left";
      "ctrl+shift+j" = "neighboring_window down";
      "ctrl+shift+k" = "neighboring_window up";
      "ctrl+shift+l" = "neighboring_window right";

      "alt+shift+s" = "launch --location=vsplit --cwd=current --bias=40";
    };
  };
}
