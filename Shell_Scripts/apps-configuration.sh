#!/usr/bin/env bash

brews=(
  git
  git-extras
  git-lfs
  mackup
  zsh
  zsh-completions
)

casks=(
  alfred
  ampps
  android-file-transfer
  atom
  cakebrew
  chrome-remote-desktop-host
  dropbox
  dupeguru
  endurance
  firefox
  flixtools
  flux
  google-chrome
  google-drive
  google-photos-backup
  gopro-studio
  handbrake
  imageoptim
  integrity
  iterm2
  jdownloader
  keka
  macclean
  messenger-for-desktop
  silverlight
  monolingual
  music-manager
  nvalt
  omnidisksweeper
  onyx
  paparazzi
  processing
  quickbooks
  skyfonts
  skype
  slack
  sourcetree
  spotify
  telegram
  tunnelbear
  unetbootin
  vlc
  torrent
  xmind
)

######################################## End of app list ########################################
set +e
set -x

  echo "Installing Homebrew ..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Updating Homebrew ..."
  brew update
  brew upgrade
  brew doctor

function install {
  cmd=$1
  shift
  for pkg in $@;
  do
    exec="$cmd $pkg"
    echo "Executing: $exec"
    if $exec ; then
      echo "Installed $pkg"
    else
      fails+=($pkg)
      print_red "Failed to execute: $exec"
    fi
  done
}

echo "Installing Java ..."
brew cask install java

echo "Installing packages ..."
brew info ${brews[@]}
install 'brew install' ${brews[@]}

echo "Installing Oh My ZSH ..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing software ..."
brew cask info ${casks[@]}
install 'brew cask install' ${casks[@]}

echo "Cleaning up ..."
brew cleanup
brew cask cleanup
brew linkapps

for fail in ${fails[@]}
do
  echo "Failed to install: $fail"
done

echo "Run `mackup restore` after DropBox has done syncing"

echo "Done!"
