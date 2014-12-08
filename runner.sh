#!/bin/bash

# Download and install Command Line Tools
if [[ ! -x /usr/bin/gcc ]]; then
  echo "Install xcode"
  xcode-select --install
fi

# Download and install Homebrew
if [[ ! -x /usr/local/bin/brew ]]; then
  echo "Install homebrew"
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

export PATH=/usr/local/bin:$PATH

if [[ ! -x /usr/local/bin/python ]]; then
  brew install python
fi

if [[ ! -x /usr/local/bin/ansible ]]; then
  brew install ansible
fi

ansible-playbook main.yml -i hosts
