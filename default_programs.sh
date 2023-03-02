sudo xbps-install 

sudo xbps-install fcitx neovim pulseaudio kitty firefox mpv feh\
  neofetch picom tmux cargo clangd docker

sudo xbps-install texlive-bin

source /etc/profile
echo $PATH

sudo tlmgr install scheme-full

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

