# dotfiles
this repo hosts my personal dotfiles, for ArchLinux running with Hyprland

# Quick Start
Cloning on a new machine
```sh
git clone https://github.com/Beeing-Amazing/dotfiles
cd dotfiles
stow nvim
```

Adding a package to the dotfiles
```sh
mv ~/path/to/dir/nvim .dotfiles/nvim/
stow nvim
```

---

# /uses
- Distro: Arch Linux
- WM: [Hyprland](https://github.com/hyprwm/Hyprland)
- Status: [waybar](https://github.com/Alexays/Waybar)
- Notification Daemon: [dunst](https://dunst-project.org/)
- Music:
    - [mpd](https://www.musicpd.org/)
    - [rmpc](https://rmpc.mierak.dev/)
    - [mpdscribble](https://github.com/MusicPlayerDaemon/mpdscribble)

## terminal setup
- [kitty](https://sw.kovidgoyal.net/kitty/) with [fish](https://fishshell.com/)
- [tmux](https://github.com/tmux/tmux)
    - Plugin manager: [tpm](https://github.com/tmux-plugins/tpm)
- [nvim](https://neovim.io/)
    - Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

