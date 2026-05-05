{ pkgs, ... }: {
  programs.tmux = {
    enable = true;
    # HM natively supports these, so we use the dedicated options
    prefix = "C-Space";
    baseIndex = 1;
    mouse = true;

    # Everything else goes into extraConfig to preserve exact tmux syntax
    extraConfig = ''
      set -g status-left ""
      set -g status-right ""
      set -g status-style bg=default
      set-option -ga terminal-overrides ',*:Tc'
      set -g status-style fg=#FFFFFF
      set -g status-justify left
      set -g status-position top
      set -g allow-passthrough on

      set -g window-status-format "#I"
      set -g window-status-style fg=#CCCCCC,bg=default
      set -g window-status-current-format "#I"
      set -g window-status-current-style fg=#FFFFFF,bg=default

      # Binds
      bind -n M-H previous-window
      bind -n M-L next-window
      bind -n M-Space new-window
      bind -n M-W kill-window
      bind -n M-! select-window -t :1
      bind -n M-@ select-window -t :2
      bind -n M-# select-window -t :3
      bind -n M-$ select-window -t :4
      bind -n M-% select-window -t :5
    '';
  };
}
