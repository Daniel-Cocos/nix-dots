# Nix Dotfiles

### Generating the hardware configuration for different devices
```zsh
# Laptop
sudo nixos-generate-config --show-hardware-config > ~/nix/hosts/laptop/hardware-configuration.nix
# Computer
sudo nixos-generate-config --show-hardware-config > ~/nix/hosts/pc/hardware-configuration.nix
```
