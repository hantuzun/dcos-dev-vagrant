#!/usr/bin/env bash

set -xe

export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Clone github.com/dcos/dcos
sudo apt-get update
sudo apt-get install -y unzip git 

# Docker
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu zesty stable"
sudo apt-get update
sudo apt-get install -y docker-ce
sudo usermod -aG docker $USER

# pyenv & Python 3.6.3
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev xz-utils liblzma-dev python3-venv
curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
/home/vagrant/.pyenv/bin/pyenv install 3.5.4
/home/vagrant/.pyenv/bin/pyenv virtualenv -p python3.5 3.5.4 dcos
echo 'export PATH="/home/vagrant/.pyenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(pyenv init -)"' >> ~/.bashrc
echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.bashrc
echo 'pyenv activate dcos' >> ~/.bashrc
