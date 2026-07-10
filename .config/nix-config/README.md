# nix-config

Personal, flake-based Nix setup for **Void Linux**, using standalone
[home-manager](https://github.com/nix-community/home-manager) (there's no
NixOS here, so this is the "global installs" layer for your user).

## Layout

```
nix-config/
├── flake.nix                    # inputs + wiring, the only "entry point"
├── pkgs/
│   └── st/default.nix            # your custom st, built from source
├── modules/home/                 # small, reusable home-manager pieces
│   ├── core.nix                  # base settings every profile needs
│   ├── packages-stable.nix       # packages from nixpkgs (stable)
│   ├── packages-unstable.nix     # packages from nixpkgs-unstable
│   ├── terminal.nix              # wires in pkgs.st
│   └── brave.nix                 # Brave Origin via programs.brave
└── home/
    ├── main/home.nix             # profile #1 — imports everything
    └── secondary/home.nix        # profile #2 — imports a subset (example)
```

The idea: `modules/home/*.nix` are Lego bricks. Each `home/<profile>/home.nix`
just picks which bricks it wants. Add a new module file for anything new you
install (e.g. `modules/home/git.nix`, `modules/home/shell.nix`), then import
it from whichever profile(s) should have it.

## One important thing about "channels" vs flakes

Your `nixos-26.05` / `nixpkgs-unstable` channels (added via `nix-channel`)
are **not used by this flake**. Flakes pin their own inputs (see the
`inputs` block in `flake.nix`) and record exact commits in `flake.lock`,
which is what actually makes builds reproducible. You can leave your
channels installed (harmless, `home-manager` doesn't touch them), but they
won't affect anything here. Stable vs. unstable in this repo is controlled
purely by which flake input a package comes from:

- `pkgs.<name>` → stable (`nixpkgs` input, tracks `nixos-26.05`)
- `pkgs.unstable.<name>` → unstable (`nixpkgs-unstable` input), exposed via
  the overlay in `flake.nix`

## Before first use

1. In `flake.nix`, set `st-src.url` to your real repo, e.g.
   `github:youruser/st`.
2. In `home/main/home.nix` and `home/secondary/home.nix`, replace
   `REPLACE_ME` with your actual Void username / home directory.
3. Check `pkgs/st/default.nix` — it assumes a standard suckless-style
   `make PREFIX=$out install`. If your fork adds patches that need extra
   libraries (harfbuzz for ligatures, libXrandr, etc.) add them to
   `buildInputs`.
4. If `home-manager/release-26.05` doesn't exist yet when you run this,
   switch that input to `github:nix-community/home-manager/master`.

## Day to day

```bash
# apply/update the "main" profile
home-manager switch --flake .#main

# apply/update the "secondary" profile
home-manager switch --flake .#secondary

# just build without activating (sanity check)
nix build .#homeConfigurations.main.activationPackage

# build/inspect the custom st package on its own
nix build .#st
./result/bin/st

# update all locked inputs (nixpkgs, unstable, home-manager, st, brave-origin)
nix flake update

# update just one input
nix flake lock --update-input nixpkgs-unstable
```

## Adding more packages later

- Stable package → add to `modules/home/packages-stable.nix`
- Unstable package → add to `modules/home/packages-unstable.nix`
- A whole new tool with its own config → new file in `modules/home/`,
  imported from the profile(s) you want it in

## Adding a third profile

```bash
mkdir home/work
cp home/main/home.nix home/work/home.nix   # then edit imports as needed
```

And add it in `flake.nix`:

```nix
homeConfigurations.work = mkProfile "work";
```
