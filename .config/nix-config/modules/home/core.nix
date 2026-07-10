{ pkgs, ... }:

{
  # Let home-manager manage itself.
  programs.home-manager.enable = true;

  # Needed on non-NixOS distros (Void, etc.) so that Nix-installed apps,
  # desktop files, fonts, etc. get picked up correctly.
  targets.genericLinux.enable = true;

  nixpkgs.config.allowUnfree = true;

  # Home Manager release this config was first created against.
  # Do NOT bump this just because you upgraded — see the manual.
  home.stateVersion = "26.05";
}
