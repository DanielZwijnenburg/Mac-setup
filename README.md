Mac setup
========
I use this ansible script to fully provision my development machine.

####Prerequisites
I tried to minimize the manual steps as much as I could. These still remain...

- Install Xcode from the Apple store and accept TOS
- `git clone https://github.com/DanielZwijnenburg/Mac-setup.git ~/.ansible`
- `cd ~/.ansible && ./runner.sh`

#####Installed Software
Alot of software will be installed and configured.

>Brew packages

- ansible
- autojump
- automake
- brew-cask
- cloc
- coreutils
- ctags
- curl
- exiftool
- findutils
- git
- git-extras
- gnu-tar
- gpg
- htop-osx
- imagemagick
- openssl
- qt
- reattach-to-user-namespace
- the_silver_searcher
- tig
- tmate
- tmux
- v8
- vim
- wget

>Brew casks

- backblaze
- caffeine
- dropbox
- flux
- font-inconsolata
- gitx
- google-chrome
- google-drive
- imageoptim
- iterm2
- licecap
- name-mangler
- onepassword
- panic-unison
- pgadmin3
- plex-home-theater
- plex-media-server
- spotify
- steam
- vagrant
- vagrant-manager
- virtualbox
- vlc

> Languages

- Ruby 2.1.5

> Databases

- Postgresql

> iTerm2 config

- Create new or attach to existing tmux session on startup
- Import and configure Solarized color scheme
- Set Solarized Light as default color scheme

> Mac config, Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/.osx

- ~/Sites directory
- Disable quarantine window
- Check for updates everyday
- Hot Corners
  - Mission Control
  - Show Desktop
  - Application Windows
  - Start Screensaver
- Disable press and hold
- Fast key repeat
- Trackpad
  - _Normal_ scrolling
  - Right click
- Keyboard
  - Zoom with control modifier
  - Enable tab in modal windows
- Apple Mail
  - Normal copy of e-mail addresses
- Chrome
  - Enable user scripts via Github & Userscripts
- Finder
  - Expand save panel by default
  - Expand print panel by default
  - Default finder location to ~/Downloads
  - Search from current folder
