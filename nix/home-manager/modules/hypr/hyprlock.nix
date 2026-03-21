{ config, ... }: let
  homeDir = config.home.homeDirectory;
in {
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        ignore_empty_input = true;
      };

      background = [
        {
          monitor = "";
          path = "${homeDir}/.wallpapers/blurred_wallpaper.png";
        }
      ];

      "input-field" = [
        {
          monitor = "";
          size = "200, 40";
          outline_thickness = 0;
          inner_color = "rgba(0, 0, 0, 0.4)";
          rounding = 40;
          font_color = "rgb(255, 255, 255)";
          fade_on_empty = true;
          fade_timeout = 1300;
          placeholder_text = "<i>Password</i>";
          hide_input = false;
          check_color = "rgb(204, 136, 34)";
          fail_color = "rgb(204, 34, 34)";
          fail_text = "<i>$FAIL</i>";
          fail_transition = 300;
          position = "0, -20";
          halign = "center";
          valign = "center";
          shadow_passes = 10;
          shadow_size = 20;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.6;
        }
      ];

      image = [
        {
          monitor = "";
          path = "${homeDir}/.wallpapers/square_wallpaper.png";
          size = 280;
          rounding = 30;
          border_size = 4;
          border_color = "rgba(0, 0, 0, 0)";
          rotate = 0;
          reload_time = -1;
          position = "0, 200";
          halign = "center";
          valign = "center";
          shadow_passes = 10;
          shadow_size = 20;
          shadow_color = "rgb(0,0,0)";
          shadow_boost = 1.6;
        }
      ];
    };
  };
}
