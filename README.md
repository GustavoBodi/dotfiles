# Dotfiles
This is my collection of dotfiles. It includes configuration for X11, shell,
terminal emulator and others.

## Installation
Although most of the configurations here can be used in any distribution, the
install script was made specifically for my needs on void linux. Its usage is
quite simple:

```bash
chmod +x ./install.sh
./install.sh
```

After running it, all the default applications that I use must have been
installed correctly (it may take a long time because it includes a full
installation of Latex).

## Updating
All of this files here are to be linked with a terminal utility called gnu
stow. It basically creates symbolic links from the specified directory to the
target. The included Makefile makes it easy to use. After cloning the
repository on your home directory, run:
```bash
cd dotfiles
make
```

## License
All my dotfiles are licensed under the MIT license.
