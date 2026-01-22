#!/bin/bash

# Dotfiles Setup Script
# Automated installation of development environment tools

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Print functions
print_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Prompt for yes/no
prompt_yn() {
    while true; do
        read -p "$1 (y/n): " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer y or n.";;
        esac
    done
}

print_info "=== Dotfiles Setup Script ==="
echo ""

# Install GNU Stow
print_info "Installing GNU Stow..."
if command_exists stow; then
    print_warning "Stow is already installed"
else
    sudo apt install -y stow
    print_success "Stow installed successfully"
fi

# Install Ripgrep
print_info "Installing Ripgrep..."
if command_exists rg; then
    print_warning "Ripgrep is already installed"
else
    sudo apt install -y ripgrep
    print_success "Ripgrep installed successfully"
fi

# Install xclip
print_info "Installing xclip..."
if command_exists xclip; then
    print_warning "xclip is already installed"
else
    sudo apt install -y xclip
    print_success "xclip installed successfully"
fi

# Install Zsh
print_info "Installing Zsh..."
if command_exists zsh; then
    print_warning "Zsh is already installed"
else
    sudo apt install -y zsh
    print_success "Zsh installed successfully"
fi

# Install Mise
print_info "Installing Mise..."
if command_exists mise; then
    print_warning "Mise is already installed"
else
    curl https://mise.run | sh
    print_success "Mise installed successfully"
fi

# Install Starship
print_info "Installing Starship prompt..."
if command_exists starship; then
    print_warning "Starship is already installed"
else
    curl -sS https://starship.rs/install.sh | sh -s -- -y
    print_success "Starship installed successfully"
fi

# Install Neovim
print_info "Installing Neovim (latest release)..."
if [ -d "/opt/nvim-linux-x86_64" ]; then
    print_warning "Neovim is already installed in /opt/nvim-linux-x86_64"
    if prompt_yn "Do you want to reinstall Neovim?"; then
        print_info "Downloading Neovim..."
        curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
        print_info "Removing old Neovim installation..."
        sudo rm -rf /opt/nvim-linux-x86_64
        print_info "Extracting Neovim..."
        sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
        rm nvim-linux-x86_64.tar.gz
        print_success "Neovim reinstalled successfully"
    fi
else
    print_info "Downloading Neovim..."
    curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
    print_info "Extracting Neovim to /opt..."
    sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
    rm nvim-linux-x86_64.tar.gz
    print_success "Neovim installed successfully"
fi

# Optional: Install Kitty
echo ""
if prompt_yn "Do you want to install Kitty terminal?"; then
    print_info "Installing Kitty..."
    if command_exists kitty; then
        print_warning "Kitty is already installed"
    else
        curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
        print_success "Kitty installed successfully"
        
        echo ""
        if prompt_yn "Do you want to set up Kitty desktop integration?"; then
            print_info "Setting up desktop integration..."
            # Create symbolic links for desktop integration
            ln -sf ~/.local/kitty.app/bin/kitty ~/.local/bin/
            # Copy the kitty.desktop file
            cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
            # Update the path to the kitty icon in the kitty.desktop file
            sed -i "s|Icon=kitty|Icon=$HOME/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop
            print_success "Desktop integration configured"
        fi
    fi
else
    print_info "Skipping Kitty installation"
fi

# Final instructions
echo ""
print_success "=== Setup Complete! ==="
echo ""
print_info "Next steps:"
echo "  1. Create symlinks with Stow:"
echo "     cd ~/.config/dotfiles"
echo "     stow .config"
echo ""
echo "  2. Change your default shell to Zsh:"
echo "     chsh -s \$(which zsh)"
echo ""
echo "  3. Log out and log back in for shell changes to take effect"
echo ""
echo "  4. Verify installations:"
echo "     zsh --version"
echo "     nvim --version"
echo "     starship --version"
echo "     mise --version"
echo "     xclip -version"
echo ""

# Offer to change shell now
if prompt_yn "Do you want to change your default shell to Zsh now?"; then
    chsh -s $(which zsh)
    print_success "Default shell changed to Zsh"
    print_warning "Please log out and log back in for the change to take effect"
fi

print_success "Setup script finished!"
