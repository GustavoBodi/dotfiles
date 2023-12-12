sudo xbps-install -Syyuu
sudo xbps-install base-devel firefox kitty zsh git gcc gdb neovim python \
  ripgrep neofetch dmenu zathura picom tmux feh mpv pulseaudio clang \
  clang-analyzer docker fcitx cargo xorg-server-devel libX11-devel openssh xtools \
  libXft-devel libXinerama-devel cmake ninja meson stow xxd nerd-fonts-ttf \
  mesa-intel-dri sysfsutils xclip tlp upower acpi glxinfo texlive-bin

sudo tlmgr install scheme-full
sudo ln -s /etc/sv/tlp /var/service/
