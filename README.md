# Dotfiles Repository

This repository contains my dotfiles for configuring neovim (nvim), tmux, and zsh. These configurations are managed using STOW for easy deployment on different systems.

## Usage

### Prerequisites

Before using these dotfiles, ensure you have the following installed on your system:

- [STOW](https://www.gnu.org/software/stow/)
- [Neovim (nvim)](https://neovim.io/)
- [tmux](https://github.com/tmux/tmux)
- [Zsh](https://www.zsh.org/)

### Installation

To set up these dotfiles on your system, run the following command from the root of the repository:

```bash
./setup.sh
```
This script will use STOW to symlink the configuration files for neovim, tmux, and zsh to the appropriate locations in your home directory.


### Removal

If you want to remove the symlinked dotfiles, you can use the following command:
```bash
./destroy.sh
```

This script will remove the symlinks created by the setup.sh script, effectively reverting your configuration to its previous state.
