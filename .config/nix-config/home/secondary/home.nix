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
    # Left out on purpose, as an example of picking only what you want:
    # ../../modules/home/packages-stable.nix
    # ../../modules/home/packages-unstable.nix
  ];

  # Same physical user, different generation — or point this at a different
  # username/homeDirectory if this profile represents another account.
  home.username = "bryant";
  home.homeDirectory = "/home/bryant";
}
