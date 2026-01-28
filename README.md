# Dotfiles Setup

A streamlined setup script for configuring a Linux development environment with Neovim, Zsh, Starship prompt, Tmux, and optional Kitty terminal.

## Features

- **Zsh** - Modern shell with improved features
- **Starship** - Fast, customizable prompt
- **Neovim** - Latest version from official releases
- **Tmux** - Terminal multiplexer for managing multiple sessions
- **TPM** (Optional) - Tmux Plugin Manager
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
3. **Installs xclip** - Clipboard integration for terminal
4. **Installs Mise** - Universal tool version manager
5. **Installs Zsh** - Modern shell replacement
6. **Installs Starship** - Cross-shell prompt
7. **Installs Neovim** - Latest stable release
8. **Installs Tmux** - Terminal multiplexer
9. **Optionally installs TPM** - Tmux Plugin Manager
10. **Optionally installs Kitty** - Terminal emulator with desktop integration

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

2. **Create symlinks with Stow**:

```bash
cd ~/.config/dotfiles
stow .config
```

3. **Change your default shell to Zsh**:

```bash
chsh -s $(which zsh)
```

4. **Log out and log back in** for the shell change to take effect.

5. **Verify installations**:

```bash
zsh --version
nvim --version
starship --version
mise --version
tmux -V
```

## Custom Tmux Keybindings

This configuration uses custom keybindings for better ergonomics:

### Prefix Key
- **Prefix**: `Ctrl+a` (instead of default `Ctrl+b`)

### Window Management
- `Ctrl+a` then `n` - Next window
- `Ctrl+a` then `p` - Previous window
- `Ctrl+a` then `0-9` - Jump to window 0-9
- `Ctrl+a` then `w` - List all windows

### Pane Management
- `Ctrl+a` then `|` - Split pane vertically (left/right)
- `Ctrl+a` then `-` - Split pane horizontally (top/bottom)
- `Ctrl+h/j/k/l` - Navigate between panes (Vim-style, auto-zoom enabled)
- `Ctrl+a` then `z` - Toggle zoom on current pane
- `Ctrl+a` then `x` - Close current pane

### Session Management
- `Ctrl+a` then `d` - Detach from session
- `Ctrl+a` then `s` - List sessions
- `Ctrl+a` then `$` - Rename session

### Copy Mode
- `Ctrl+a` then `[` - Enter copy mode (use Vim keybindings)
- `Ctrl+a` then `v` - Open scrollback buffer in Neovim

### Plugin Manager (TPM)
- `Ctrl+a` then `Shift+i` - Install plugins
- `Ctrl+a` then `Shift+u` - Update plugins
- `Ctrl+a` then `Alt+u` - Uninstall plugins

### Reloading Configuration

After editing your `tmux.conf`, reload it without restarting Tmux:

```bash
tmux source ~/.config/tmux/tmux.conf
```

Or from within Tmux:
```
Ctrl+a then :source-file ~/.config/tmux/tmux.conf
```

## Directory Structure

```
~/.config/dotfiles/
├── .config/
│   ├── nvim/
│   ├── tmux/
│   │   └── tmux.conf
│   ├── kitty/
│   ├── starship.toml
│   └── ... (other configs)
├── setup.sh
└── README.md
```

After running `stow .config`, all directories in `dotfiles/.config/` will be symlinked to `~/.config/`.

## Manual Setup Guide

### Install Tmux

```bash
sudo apt install tmux
```

### Install Tmux Plugin Manager (TPM)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

After installation, start Tmux and press `Ctrl+a` then `Shift+i` to install plugins.

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

### Install xclip

```bash
sudo apt install xclip
```

xclip enables clipboard integration with the terminal, allowing you to copy and paste between Neovim and other applications.

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

**Tmux configuration not loading**: Ensure your `tmux.conf` is in `~/.config/tmux/tmux.conf` or create a symlink from `~/.tmux.conf` to your config location.

**TPM plugins not installing**: Make sure TPM is installed at `~/.tmux/plugins/tpm` and press `Ctrl+a` then `Shift+i` inside a Tmux session.

## Uninstalling

To remove symlinks created by stow:

```bash
cd ~/.config/dotfiles
stow -D .config
```
