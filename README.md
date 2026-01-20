# Dotfiles Setup

A streamlined setup script for configuring a Linux development environment with Neovim, Zsh, Starship prompt, and optional Kitty terminal.

## Features

- **Zsh** - Modern shell with improved features
- **Starship** - Fast, customizable prompt
- **Neovim** - Latest version from official releases
- **Mise** - Unified tool version manager
- **GNU Stow** - Symlink manager for dotfiles
- **Kitty** (Optional) - GPU-accelerated terminal emulator

## Prerequisites

- Ubuntu/Debian-based Linux distribution
- `curl` installed
- `sudo` privileges
- Git installed

## Quick Start

1. Clone this repository to your `~/.config` directory:

```bash
cd ~/.config
git clone  dotfiles
```

2. Run the setup script:

```bash
cd dotfiles
chmod +x setup.sh
./setup.sh
```

3. Follow the interactive prompts to choose which components to install.

## What the Script Does

1. **Updates system packages** - Ensures apt is up to date
2. **Installs GNU Stow** - For managing dotfile symlinks
3. **Installs Mise** - Universal tool version manager
4. **Installs Zsh** - Modern shell replacement
5. **Installs Starship** - Cross-shell prompt
6. **Installs Neovim** - Latest stable release
7. **Optionally installs Kitty** - Terminal emulator with desktop integration

## Manual Installation

If you prefer to install components manually, see the [Manual Setup Guide](#manual-setup-guide) below.

## Post-Installation

After running the setup script:

1. **Set up Zsh configuration directory** (if your .zshrc is in dotfiles):

Create a `.zshenv` file in your home directory to point Zsh to your config location:

```bash
echo 'export ZDOTDIR="$HOME/.config/zsh"' > ~/.zshenv
```

This tells Zsh to look for `.zshrc` in `~/.config/zsh/` instead of `~/.zshrc`.

1. **Create symlinks with Stow**:

```bash
cd ~/.config/dotfiles
stow .config
```

1. **Change your default shell to Zsh**:

```bash
chsh -s $(which zsh)
```

1. **Log out and log back in** for the shell change to take effect.

2. **Verify installations**:

```bash
zsh --version
nvim --version
starship --version
mise --version
```

## Directory Structure

```
~/.config/dotfiles/
├── .config/
│   ├── nvim/
│   ├── kitty/
│   ├── starship.toml
│   └── ... (other configs)
├── setup.sh
└── README.md
```

After running `stow .config`, all directories in `dotfiles/.config/` will be symlinked to `~/.config/`.

## Manual Setup Guide

### Install Kitty

```bash
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
```

For desktop integration, see: <https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux>

### Install Stow

```bash
sudo apt install stow
```

### Install Ripgrep

```bash
sudo apt install ripgrep
```

### Install Mise

```bash
curl https://mise.run | sh
```

### Install Zsh

```bash
sudo apt install zsh
```

### Install Starship

```bash
curl -sS https://starship.rs/install.sh | sh
```

### Install Neovim

```bash
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
```

Optionally add to your PATH in `~/.zshrc`:

```bash
export PATH="$PATH:/opt/nvim-linux-x86_64/bin"
```

### Create Symlinks

```bash
cd ~/.config/dotfiles
stow .config
```

## Troubleshooting

**Stow conflicts**: If stow reports conflicts, you may have existing config files. Back them up and remove them before running stow.

**Zsh not default shell**: Run `chsh -s $(which zsh)` and log out/in.

**Neovim not in PATH**: Ensure `/opt/nvim-linux-x86_64/bin` is in your PATH.

## Uninstalling

To remove symlinks created by stow:

```bash
cd ~/.config/dotfiles
stow -D .config
```
