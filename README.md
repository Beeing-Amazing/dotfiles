this repo hosts my personal dotfiles, for ArchLinux running with niri

# Quick Start
Cloning on a new machine
```sh
git clone https://github.com/Beeing-Amazing/dotfiles
cd dotfiles
stow nvim
```

Adding a package to the dotfiles
```sh
mv ~/.config/nvim .dotfiles/nvim/.config/
stow nvim
```

---

# /uses
- Distro: ArchLinux
- WM: [niri](https://github.com/niri-wm/niri)
- Notification Daemon: [dunst](https://dunst-project.org/)
- Music:
    - [mpd](https://www.musicpd.org/)
    - [rmpc](https://rmpc.mierak.dev/)
    - [mpdscribble](https://github.com/MusicPlayerDaemon/mpdscribble)
- Launcher:
    - [wlr-which-key](https://github.com/MaxVerevkin/wlr-which-key)
    - [fuzzel](https://codeberg.org/dnkl/fuzzel)

## terminal setup
- [kitty](https://sw.kovidgoyal.net/kitty/) with [fish](https://fishshell.com/)
- [nvim](https://neovim.io/)
    - Plugin manager: [lazy.nvim](https://github.com/folke/lazy.nvim)

# roadmap
- [ ] eww widgets for clock, battery, tray, calendar, notifs, app launcher
- [ ] wallpaper manager
- [ ] browser landing page and small css tweaks
