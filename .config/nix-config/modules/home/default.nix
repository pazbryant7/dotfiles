{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.st.packages.${pkgs.system}.default
    inputs.dwm.packages.${pkgs.system}.default
    inputs.slstatus.packages.${pkgs.system}.default
    inputs.brave-origin.packages.${pkgs.system}.default
  ];
}
