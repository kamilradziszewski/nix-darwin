# nix-darwin flake config for MacOS

## Installation

- Install nix using the [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer); **make sure you use it without the `--determinate` flag.** The `--determinate` flag installs the Determinate Nix distribution which does not work out of the box with nix-darwin.

`curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install`

<!-- - Install `nix-darwin`

`nix run nix-darwin/master#darwin-rebuild -- switch` -->

- Create nix config directory:

```
mkdir -p ~/.config/nix-darwin
```

- `cd` into nix config directory:

```
cd ~/.config/nix-darwin
```

- Run temporary nix-shell with git:

```
nix-shell -p git
```

- Clone the repo with the flake (you can exit git-shell afterwards with `exit`):

```
git clone https://github.com/kamilradziszewski/nix-darwin.git .
```

- Change hostname (might require restarting computer):

```
sudo scutil --set HostName __YOUR_HOSTNAME__
sudo scutil --set LocalHostName __YOUR_HOSTNAME__
dscacheutil -flushcache
```

- Change system, username, useremail, and hostname in the `flake.nix` file

You can check current values with
`whoami`, `scutil --get HostName`, and `scutil --get LocalHostName`

- Build the flake running:

```
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```

- You might need to install Rosetta (watch the console). To do so, run:

```
softwareupdate --install-roseta
```

- Run `switch` (it's an alias from the config), or `darwin-rebuild switch` (or `darwin-rebuild switch --flake ~/.config/nix-darwin` if calling from another directory)

## Commands

Rebuild flake:

`darwin-rebuild switch --flake ~/.config/nix-darwin`

Garbage collection:

`nix-collect-garbage -d`

## Links

### nix-darwin

https://github.com/LnL7/nix-darwin

### nix-homebrew

https://github.com/zhaofengli/nix-homebrew

### Home Manager Manual

https://nix-community.github.io/home-manager/

### nix-darwin Configuration Options

https://daiderd.com/nix-darwin/manual/index.html

https://mynixos.com/nix-darwin/options

### Search nix packages

https://search.nixos.org/packages

### NixOS & Flakes Book

https://nixos-and-flakes.thiscute.world/

### nix.dev

https://nix.dev/
