# Anything listed here comes from nixpkgs (stable), i.e. the same set as
# `pkgs` everywhere else in this repo. Add/remove freely.
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    google-chrome
  ];
}
