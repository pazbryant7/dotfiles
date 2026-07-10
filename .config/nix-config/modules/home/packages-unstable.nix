# Anything listed here comes from nixpkgs-unstable, exposed as `pkgs.unstable`
# by the overlay in flake.nix. Add/remove freely.
{ pkgs, ... }:

{
  home.packages = with pkgs.unstable; [
    bitwarden-cli
  ];
}
