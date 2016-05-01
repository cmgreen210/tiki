#!/bin/bash

curl -sk https://raw.githubusercontent.com/torch/ezinstall/master/install-deps | bash -e

if ! [ -d "torch" ]; then
    git clone https://github.com/torch/distro.git torch --recursive
fi
cd torch; bash install-deps;
./install.sh

src() {
    source "$1"
}

if [ -f "$HOME/.bashrc" ] 
then
    src "$HOME/.bashrc"
fi

if [ -f "$HOME/.zshrc" ]
then
    src "$HOME/.zshrc"
fi

if [ -f "$HOME/.profile" ]
then
    src "$HOME/.profile"
fi

curl -sk https://raw.githubusercontent.com/soumith/fblualib/master/install_all.sh | bash -e

git clone https://github.com/torch/nn && ( cd nn && git checkout getParamsByDevice && luarocks make rocks/nn-scm-1.rockspec )

git clone https://github.com/facebook/fbtorch.git && ( cd fbtorch && luarocks make rocks/fbtorch-scm-1.rockspec )

git clone https://github.com/facebook/fbnn.git && ( cd fbnn && luarocks make rocks/fbnn-scm-1.rockspec )

# go get a coffee
git clone https://github.com/facebook/fbcunn.git && ( cd fbcunn && luarocks make rocks/fbcunn-scm-1.rockspec )
