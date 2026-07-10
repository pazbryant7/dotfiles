{
  description = "Personal Nix configuration for Void Linux (home-manager, multi-profile)";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    st.url = "github:pazbryant7/st";
    dwm.url = "github:pazbryant7/dwm";
    slstatus.url = "github:pazbryant7/slstatus";
    brave-origin.url = "github:Daniel-42-z/brave-origin-flake";
  };

  outputs =
    {
      self,
      st,
      dwm,
      nixpkgs,
      slstatus,
      flake-utils,
      brave-origin,
      home-manager,
      nixpkgs-unstable,
      ...
    }:
    let
      inputs = {
        inherit
          brave-origin
          dwm
          st
          slstatus
          ;
      };

      hmSystem = "x86_64-linux";

      overlay = final: prev: {
        unstable = import nixpkgs-unstable {
          system = hmSystem;
          config.allowUnfree = true;
        };
      };

      hmPkgs = import nixpkgs {
        system = hmSystem;
        config.allowUnfree = true;
        overlays = [ overlay ];
      };

      mkProfile =
        name:
        home-manager.lib.homeManagerConfiguration {
          pkgs = hmPkgs;
          extraSpecialArgs = { inherit inputs; };
          modules = [ ./home/${name}/home.nix ];
        };

      perSystemOutputs = flake-utils.lib.eachDefaultSystem (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
        in
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nil
              statix
              nixfmt
            ];
          };
          formatter = pkgs.nixfmt-tree;
          packages = { };
        }
      );
    in
    {
      inherit (perSystemOutputs) devShells formatter packages;

      homeConfigurations = {
        main = mkProfile "main";
        secondary = mkProfile "secondary";
      };
    };
}
