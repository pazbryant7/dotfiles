{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:

{
  imports = [
    ../../modules/home/core.nix
    ../../modules/home/default.nix
    ../../modules/home/overlays.nix
    ../../modules/home/packages-stable.nix
    ../../modules/home/packages-unstable.nix
  ];

  # Fill these in with your real Void Linux user.
  home.username = "bryant";
  home.homeDirectory = "/home/bryant";

  # Anything specific to just this profile goes here, e.g.:
  # home.packages = with pkgs; [ neofetch ];
}
